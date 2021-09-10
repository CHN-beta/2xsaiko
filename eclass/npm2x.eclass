# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: npm2x.eclass
# @MAINTAINER:
# 2xsaiko <me@dblsaiko.net>
# @AUTHOR:
# 2xsaiko <me@dblsaiko.net>
# @BLURB: handle packages that need to be installed using npm install
# @DESCRIPTION:
# Provides functions for packaging software using the npm package manager.

EXPORT_FUNCTIONS src_unpack src_compile

# @ECLASS-VARIABLE: NPM_MODULES
# @DESCRIPTION:
# Contains libraries to install into node_modules. This should contain all
# libraries, including recursive dependencies, followed by the install path of
# the module. This will be read by npm2x_set_globals to output NPM_SRC_URI for
# use in SRC_URI.
#
# The way to get the content of this array is to extract the package yourself,
# then call npm install and then use the npm2x-gen-links script in the _util
# directory of this repository which will output a NPM_MODULES declaration for
# you:
#
#     % npm install
#     % /var/db/repos/2xsaiko/_util/npm2x-gen-links >> my-npm-package-1.0.0.ebuild
#
# @EXAMPLE:
#
# @CODE
# NPM_MODULES="
#     balanced-match	1.0.0	balanced-match
#     brace-expansion	1.1.11	brace-expansion
#     clean-css	4.1.11	clean-css
# "
# @CODE

# @ECLASS-VARIABLE: NPM_SRC_URI
# @DESCRIPTION:
# Gets generated by npm2x_set_globals from NPM_MODULES. Contains the entries to
# append to SRC_URI to download the necessary npm packages.

# @ECLASS-VARIABLE: NPM_FILES
# @DESCRIPTION:
# Contains the list of distfiles downloaded. Used to implement special unpacking
# logic in npm2x_filter_archives.

# @ECLASS-VARIABLE: NPM_ARGS
# @DESCRIPTION:
# Arguments to pass to npm rebuild in src_compile.

BDEPEND="
	net-libs/nodejs[npm]
	app-misc/jq"

npm2x_src_unpack() {
	npm2x_filter_archives
	default

	cd "${S}"
	npm2x_src_unpack_modules
}

npm2x_src_compile() {
	npm rebuild ${NPM_ARGS} || die 'npm rebuild failed'
}

# @FUNCTION: npm2x_set_globals
# @DESCRIPTION:
# Sets up the NPM_SRC_URI variable from NPM_MODULES.
npm2x_set_globals() {
	local uri tok
	local pstate package version path shortname filename
	_npm2x_sources_parse_init
	NPM_SRC_URI=""
	NPM_FILES=""

	for tok in $NPM_MODULES; do
		if _npm2x_sources_parse "$tok"; then
			uri="mirror://npm2x/${package}/-/${shortname}-${version}.tgz"
			NPM_SRC_URI="${NPM_SRC_URI}${uri} -> ${filename} "
			NPM_FILES="${NPM_FILES}${filename} "
		fi
	done

	_NPM2X_SET_GLOBALS_CALLED=1
}

# @FUNCTION: npm2x_filter_archives
# @DESCRIPTION:
# Strips out all the dependencies specified in $NPM_MODULES from $A to keep them
# from being unpacked by default_src_unpack since unpacking is handled
# separately by this eclass.
#
# NB: This is hacky as fuck since $A is supposed to be read-only.
npm2x_filter_archives() {
	if [[ ! ${_NPM2X_SET_GLOBALS_CALLED} ]]; then
		die "npm2x_set_globals must be called in global scope"
	fi

	A="$(
		comm -23 \
			<(echo ${A} | xargs -n1 | sort) \
			<(echo ${NPM_FILES} | xargs -n1 | sort)
	)"
}

# @FUNCTION: npm2x_src_unpack_modules
# @DESCRIPTION:
# Unpacks all the modules specified in $NPM_MODULES into the node_modules
# directory. To customize this behavior, call npm2x_unpack_modules instead.
npm2x_src_unpack_modules() {
	npm2x_unpack_modules "${NPM_MODULES}"
}

# @FUNCTION: npm2x_unpack_modules
# @USAGE: <sources>
# @DESCRIPTION:
# Unpacks the modules specified in sources into the node_modules directory.
#
# Syntax for sources is the same as NPM_MODULES.
npm2x_unpack_modules() {
	local tok
	local pstate package version path shortname filename
	_npm2x_sources_parse_init

	for tok in $1; do
		if _npm2x_sources_parse "$tok"; then
			ebegin "extracting $filename"
			mkdir -p "node_modules/$path" &&
				tar xf "${DISTDIR}/$filename" --strip-components=1 -C "node_modules/$path"
			eend $?

			_npm2x_setup_bins "node_modules/$path"
		fi
	done
}

# @FUNCTION: _npm2x_setup_bins
# @USAGE: <package dir>
# @DESCRIPTION:
# Links in programs provided by the given package into the corresponding
# node_modules/.bin directory.
#
# This function is internal use only.
_npm2x_setup_bins() {
	local binname binpath nmpath

	nmpath="$(_npm2x_find_closest_node_modules "$1")"

	if ! [[ -d "${nmpath}/.bin" ]]; then
		mkdir "${nmpath}/.bin"
	fi

	while IFS=$'\t' read binname binpath; do
		binname="$(basename "${binname}")" # fix for package names like @babel/xyz
		einfo "linking bin $binname"
		ln -sr "$1/${binpath}" "${nmpath}/.bin/${binname}" || die "failed to link $1/${binpath}' -> '${nmpath}/.bin/${binname}'"
	done < <(jq -r '
		if has("bin")
		then
			if .bin | type == "string"
			then [.name, .bin]
			elif .bin | type == "object"
			then .bin | to_entries | map([.key, .value]) | .[]
			else null
			end
		else empty
		end | @tsv
	' "$1/package.json")
}

# @FUNCTION: _npm2x_find_closest_node_modules
# @USAGE: <package dir>
# @DESCRIPTION:
# Prints the closest node_modules path to the given package.
#
# This function is internal use only.
_npm2x_find_closest_node_modules() {
	cur="$1"
	last=""

	while [[ "$cur" != "$last" ]]; do
		if [[ "$(basename "$cur")" == "node_modules" ]]; then
			echo "$cur"
			return
		fi

		last="$cur"
		cur="$(dirname "$cur")"
	done

	die "couldn't find node_modules path in '$1'"
}

# @FUNCTION: _npm2x_sources_parse_init
# @USAGE:
# @DESCRIPTION:
# Initializes the source parser. This must be called before calling
# _npm2x_sources_parse.
#
# This function is internal use only.
_npm2x_sources_parse_init() {
	pstate=0
	uri=
	path=
}

# @FUNCTION: _npm2x_sources_parse
# @USAGE: <token>
# @DESCRIPTION:
# Parse one token from NPM_SOURCES variable. Returns 0 when a complete
# dependency line has been read, 1 otherwise. Sets the following variables:
#
# - package:   The full package name,              e.g. @babel/core
# - version:   The actual package version,         e.g. 7.12.9
# - shortname: The short package name,             e.g. core
# - filename:  The downloaded file name,           e.g. @babel-core-7.12.9.tgz
# - path:      The path to extract the package in, e.g. @babel/core
#
# This function is internal use only.
_npm2x_sources_parse() {
	if [[ $pstate = 0 ]]; then
		package="$1"
		pstate=1
		return 1
	elif [[ $pstate = 1 ]]; then
		version="$1"
		shortname="${package##*/}"
		filename="${package//\//-}-${version}.tgz"
		pstate=2
		return 1
	else
		path="$1"
		pstate=0
		return 0
	fi
}

# @FUNCTION: _npm2x_sources_end
# @USAGE:
# @DESCRIPTION:
# Checks whether the parser is in a valid end state.
#
# This function is internal use only.
_npm2x_sources_end() {
	if [[ $pstate != 0 ]]; then
		die "unexpected EOF; check NPM_MODULES"
	fi
}
