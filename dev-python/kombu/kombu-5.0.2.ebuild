# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{8..9} )
DISTUTILS_USE_SETUPTOOLS=bdepend

inherit distutils-r1

DESCRIPTION="AMQP Messaging Framework for Python"
HOMEPAGE="https://pypi.org/project/kombu/ https://github.com/celery/kombu"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE="doc examples mongodb msgpack redis sqs test yaml"
RESTRICT="!test? ( test )"

# zookeeper backend support possible via dev-python/kazoo
RDEPEND="
	>=dev-python/importlib_metadata-0.18[${PYTHON_USEDEP}]
	>=dev-python/py-amqp-5.0[${PYTHON_USEDEP}]
	<dev-python/py-amqp-6.0[${PYTHON_USEDEP}]
	>=dev-python/Pyro4-4.80[${PYTHON_USEDEP}]
	sqs? ( >=dev-python/boto3-1.4.4[${PYTHON_USEDEP}] )
	msgpack? ( >=dev-python/msgpack-0.3.0[${PYTHON_USEDEP}] )
	mongodb? ( >=dev-python/pymongo-3.3.0[${PYTHON_USEDEP}] )
	redis? ( >=dev-python/redis-py-3.3.11[${PYTHON_USEDEP}] )
	yaml? ( >=dev-python/pyyaml-3.10[${PYTHON_USEDEP}] )"
# Fix to https://github.com/celery/kombu/issues/474 obliges dev-python/pymongo to >=-3.0.2
DEPEND="${RDEPEND}
	>=dev-python/setuptools-20.6.7[${PYTHON_USEDEP}]
	test? (
		>=dev-python/case-1.5.2[${PYTHON_USEDEP}]
		<=dev-python/pytest-5.3.5[${PYTHON_USEDEP}]
		dev-python/pytz[${PYTHON_USEDEP}]
		dev-python/unittest2[${PYTHON_USEDEP}]
	)
	doc? (
		dev-python/sphinx[${PYTHON_USEDEP}]
		>=dev-python/sphinx_celery-1.1[${PYTHON_USEDEP}]
	)"

# kazoo is optional for tests.
# Refrain for now, no established demand for it from users

# Req'd for test phase
DISTUTILS_IN_SOURCE_BUILD=1

PATCHES=(
)

python_prepare_all() {
	# AttributeError: test_Etcd instance has no attribute 'patch'
	rm t/unit/transport/test_etcd.py || die
	# allow use of new (renamed) msgpack
	sed -i '/msgpack/d' requirements/extras/msgpack.txt || die
	# pytest-sugar is not packaged
	sed -i '/pytest-sugar/d' requirements/test.txt || die
	distutils-r1_python_prepare_all
}

python_compile_all() {
	# Doc build misses and skips only content re librabbitmq which is not in portage
	if use doc; then
		emake -C docs html
	fi
}

python_test() {
	esetup.py test
}

python_install_all() {
	if use examples; then
		docompress -x "/usr/share/doc/${PF}/examples"
		docinto examples
		dodoc -r examples/.
	fi
	use doc && local HTML_DOCS=( docs/_build/html/. )
	distutils-r1_python_install_all
}
