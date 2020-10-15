# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( pypy3 python3_{6..9} )
inherit distutils-r1 go-module

MY_PN="meta.sr.ht"

DESCRIPTION="sr.ht core account services"
HOMEPAGE="https://git.sr.ht/~sircmpwn/meta.sr.ht"

EGO_SUM=(
	"git.sr.ht/~sircmpwn/getopt v0.0.0-20191230200459-23622cc906b3 h1:4wDp4BKF7NQqoh73VXpZsB/t1OEhDpz/zEpmdQfbjDk="
	"git.sr.ht/~sircmpwn/getopt v0.0.0-20191230200459-23622cc906b3/go.mod h1:wMEGFFFNuPos7vHmWXfszqImLppbc0wEhh6JBfJIUgw="
	"git.sr.ht/~sircmpwn/git.sr.ht v0.0.0-20200522161859-d95fde22d4cb h1:ixtZPOUz/VuGX0/zjtjetNOTHynF9V8XJXSFBpUO0Kg="
	"git.sr.ht/~sircmpwn/git.sr.ht/api v0.0.0-20200522161859-d95fde22d4cb h1:z4vyafNexduh0IPXKFVixQoX7rdCOyC4UdXL+z1RTwQ="
	"git.sr.ht/~sircmpwn/git.sr.ht/api v0.0.0-20200522161859-d95fde22d4cb/go.mod h1:G3xwQK2JHUOihjQVAuqCPrwhHOUFtitZ2NqqjAIBS/o="
	"git.sr.ht/~sircmpwn/gql.sr.ht v0.0.0-20200519155752-5492494ccefa/go.mod h1:V38DHc2+k1GmbNT4pE6OH/2fOXYcZHn9o/PUAEXH1P0="
	"git.sr.ht/~sircmpwn/gql.sr.ht v0.0.0-20200519162029-221cb5d1e0eb h1:+PVqrSoeMKiAHrm37c+y0bn6GBZabvk15ol/xLfpVHs="
	"git.sr.ht/~sircmpwn/gql.sr.ht v0.0.0-20200519162029-221cb5d1e0eb/go.mod h1:V38DHc2+k1GmbNT4pE6OH/2fOXYcZHn9o/PUAEXH1P0="
	"git.sr.ht/~sircmpwn/gql.sr.ht v0.0.0-20200522185219-a42c4594e078 h1:sKc9M81LcnicZJ3tO3FZ0Y4a1kFgwHxjLSqm8mSoIj8="
	"git.sr.ht/~sircmpwn/gql.sr.ht v0.0.0-20200522185219-a42c4594e078/go.mod h1:V38DHc2+k1GmbNT4pE6OH/2fOXYcZHn9o/PUAEXH1P0="
	"git.sr.ht/~sircmpwn/gql.sr.ht v0.0.0-20200525161308-f95a9bea7eb4 h1:auiuwtFjj2tK5BSqrSQgTU0I3trlm83nKIuO2ao1okY="
	"git.sr.ht/~sircmpwn/gql.sr.ht v0.0.0-20200525161308-f95a9bea7eb4/go.mod h1:V38DHc2+k1GmbNT4pE6OH/2fOXYcZHn9o/PUAEXH1P0="
	"git.sr.ht/~sircmpwn/meta.sr.ht v0.0.0-20200518144527-95d3fd46e3ba h1:I/zSOINDGPOnYRJGHQOqhKwhdbxgisZEE7SU5i0uhvs="
	"github.com/99designs/gqlgen v0.11.3 h1:oFSxl1DFS9X///uHV3y6CEfpcXWrDUxVblR4Xib2bs4="
	"github.com/99designs/gqlgen v0.11.3/go.mod h1:RgX5GRRdDWNkh4pBrdzNpNPFVsdoUFY2+adM6nb1N+4="
	"github.com/99designs/gqlgen v0.11.4-0.20200512031635-40570d1b4d70 h1:bZj4qAWfwu0SFTx5QsEI+y7JTji7L7ndm6snyDEIVLs="
	"github.com/99designs/gqlgen v0.11.4-0.20200512031635-40570d1b4d70/go.mod h1:RgX5GRRdDWNkh4pBrdzNpNPFVsdoUFY2+adM6nb1N+4="
	"github.com/BurntSushi/toml v0.3.1/go.mod h1:xHWCNGjB5oqiDr8zfno3MHue2Ht5sIBksp03qcyfWMU="
	"github.com/Masterminds/squirrel v1.4.0 h1:he5i/EXixZxrBUWcxzDYMiju9WZ3ld/l7QBNuo/eN3w="
	"github.com/Masterminds/squirrel v1.4.0/go.mod h1:yaPeOnPG5ZRwL9oKdTsO/prlkPbXWZlRVMQ/gGlzIuA="
	"github.com/agnivade/levenshtein v1.0.1/go.mod h1:CURSv5d9Uaml+FovSIICkLbAUZ9S4RqaHDIsdSBg7lM="
	"github.com/agnivade/levenshtein v1.0.3 h1:M5ZnqLOoZR8ygVq0FfkXsNOKzMCk0xRiow0R5+5VkQ0="
	"github.com/agnivade/levenshtein v1.0.3/go.mod h1:4SFRZbbXWLF4MU1T9Qg0pGgH3Pjs+t6ie5efyrwRJXs="
	"github.com/alcortesm/tgz v0.0.0-20161220082320-9c5fe88206d7/go.mod h1:6zEj6s6u/ghQa61ZWa/C2Aw3RkjiTBOix7dkqa1VLIs="
	"github.com/alecthomas/template v0.0.0-20160405071501-a0175ee3bccc/go.mod h1:LOuyumcjzFXgccqObfd/Ljyb9UuFJ6TxHnclSeseNhc="
	"github.com/alecthomas/template v0.0.0-20190718012654-fb15b899a751/go.mod h1:LOuyumcjzFXgccqObfd/Ljyb9UuFJ6TxHnclSeseNhc="
	"github.com/alecthomas/units v0.0.0-20151022065526-2efee857e7cf/go.mod h1:ybxpYRFXyAe+OPACYpWeL0wqObRcbAqCMya13uyzqw0="
	"github.com/alecthomas/units v0.0.0-20190717042225-c3de453c63f4/go.mod h1:ybxpYRFXyAe+OPACYpWeL0wqObRcbAqCMya13uyzqw0="
	"github.com/andreyvit/diff v0.0.0-20170406064948-c7f18ee00883/go.mod h1:rCTlJbsFo29Kk6CurOXKm700vrz8f0KW0JNfpkRJY/8="
	"github.com/anmitsu/go-shlex v0.0.0-20161002113705-648efa622239/go.mod h1:2FmKhYUyUczH0OGQWaF5ceTx0UBShxjsH6f8oGKYe2c="
	"github.com/arbovm/levenshtein v0.0.0-20160628152529-48b4e1c0c4d0/go.mod h1:t2tdKJDJF9BV14lnkjHmOQgcvEKgtqs5a1N3LNdJhGE="
	"github.com/armon/go-socks5 v0.0.0-20160902184237-e75332964ef5/go.mod h1:wHh0iHkYZB8zMSxRWpUBQtwG5a7fFgvEO+odwuTv2gs="
	"github.com/beorn7/perks v0.0.0-20180321164747-3a771d992973/go.mod h1:Dwedo/Wpr24TaqPxmxbtue+5NUziq4I4S80YR8gNf3Q="
	"github.com/beorn7/perks v1.0.0/go.mod h1:KWe93zE9D1o94FZ5RNwFwVgaQK1VOXiVxmqh+CedLV8="
	"github.com/beorn7/perks v1.0.1 h1:VlbKKnNfV8bJzeqoa4cOKqO6bYr3WgKZxO8Z16+hsOM="
	"github.com/beorn7/perks v1.0.1/go.mod h1:G2ZrVWU2WbWT9wwq4/hrbKbnv/1ERSJQ0ibhJ6rlkpw="
	"github.com/cespare/xxhash/v2 v2.1.1 h1:6MnRN8NT7+YBpUIWxHtefFZOKTAPgGjpQSxqLNn0+qY="
	"github.com/cespare/xxhash/v2 v2.1.1/go.mod h1:VGX0DQ3Q6kWi7AoAeZDth3/j3BFtOZR5XLFGgcrjCOs="
	"github.com/cpuguy83/go-md2man/v2 v2.0.0-20190314233015-f79a8a8ca69d h1:U+s90UTSYgptZMwQh2aRr3LuazLJIa+Pg3Kc1ylSYVY="
	"github.com/cpuguy83/go-md2man/v2 v2.0.0-20190314233015-f79a8a8ca69d/go.mod h1:maD7wRr/U5Z6m/iR4s+kqSMx2CaBsrgA7czyZG/E6dU="
	"github.com/cpuguy83/go-md2man/v2 v2.0.0 h1:EoUDS0afbrsXAZ9YQ9jdu/mZ2sXgT1/2yyNng4PGlyM="
	"github.com/cpuguy83/go-md2man/v2 v2.0.0/go.mod h1:maD7wRr/U5Z6m/iR4s+kqSMx2CaBsrgA7czyZG/E6dU="
	"github.com/creack/pty v1.1.9/go.mod h1:oKZEueFk5CKHvIhNR5MUki03XCEU+Q6VDXinZuGJ33E="
	"github.com/davecgh/go-spew v1.1.0/go.mod h1:J7Y8YcW2NihsgmVo/mv3lAwl/skON4iLHjSsI+c5H38="
	"github.com/davecgh/go-spew v1.1.1/go.mod h1:J7Y8YcW2NihsgmVo/mv3lAwl/skON4iLHjSsI+c5H38="
	"github.com/dgryski/trifles v0.0.0-20190318185328-a8d75aae118c/go.mod h1:if7Fbed8SFyPtHLHbg49SI7NAdJiC5WIA09pe59rfAA="
	"github.com/emirpasic/gods v1.12.0 h1:QAUIPSaCu4G+POclxeqb3F+WPpdKqFGlw36+yOzGlrg="
	"github.com/emirpasic/gods v1.12.0/go.mod h1:YfzfFFoVP/catgzJb4IKIqXjX78Ha8FMSDh3ymbK86o="
	"github.com/fernet/fernet-go v0.0.0-20191111064656-eff2850e6001 h1:/UMxx5lGDg30aioUL9e7xJnbJfJeX7vhcm57fa5udaI="
	"github.com/fernet/fernet-go v0.0.0-20191111064656-eff2850e6001/go.mod h1:2H9hjfbpSMHwY503FclkV/lZTBh2YlOmLLSda12uL8c="
	"github.com/flynn/go-shlex v0.0.0-20150515145356-3f9db97f8568/go.mod h1:xEzjJPgXI435gkrCt3MPfRiAkVrwSbHsst4LCFVfpJc="
	"github.com/gliderlabs/ssh v0.2.2/go.mod h1:U7qILu1NlMHj9FlMhZLlkCdDnU1DBEAqr0aevW3Awn0="
	"github.com/go-chi/chi v3.3.2+incompatible/go.mod h1:eB3wogJHnLi3x/kFX2A+IbTBlXxmMeXJVKy9tTv1XzQ="
	"github.com/go-chi/chi v4.1.1+incompatible h1:MmTgB0R8Bt/jccxp+t6S/1VGIKdJw5J74CK/c9tTfA4="
	"github.com/go-chi/chi v4.1.1+incompatible/go.mod h1:eB3wogJHnLi3x/kFX2A+IbTBlXxmMeXJVKy9tTv1XzQ="
	"github.com/go-git/gcfg v1.5.0 h1:Q5ViNfGF8zFgyJWPqYwA7qGFoMTEiBmdlkcfRmpIMa4="
	"github.com/go-git/gcfg v1.5.0/go.mod h1:5m20vg6GwYabIxaOonVkTdrILxQMpEShl1xiMF4ua+E="
	"github.com/go-git/go-billy/v5 v5.0.0 h1:7NQHvd9FVid8VL4qVUMm8XifBK+2xCoZ2lSk0agRrHM="
	"github.com/go-git/go-billy/v5 v5.0.0/go.mod h1:pmpqyWchKfYfrkb/UVH4otLvyi/5gJlGI4Hb3ZqZ3W0="
	"github.com/go-git/go-git-fixtures/v4 v4.0.1/go.mod h1:m+ICp2rF3jDhFgEZ/8yziagdT1C+ZpZcrJjappBCDSw="
	"github.com/go-git/go-git/v5 v5.0.0 h1:k5RWPm4iJwYtfWoxIJy4wJX9ON7ihPeZZYC1fLYDnpg="
	"github.com/go-git/go-git/v5 v5.0.0/go.mod h1:oYD8y9kWsGINPFJoLdaScGCN6dlKg23blmClfZwtUVA="
	"github.com/go-kit/kit v0.8.0/go.mod h1:xBxKIO96dXMWWy0MnWVtmwkA9/13aqxPnvrjFYMA2as="
	"github.com/go-kit/kit v0.9.0/go.mod h1:xBxKIO96dXMWWy0MnWVtmwkA9/13aqxPnvrjFYMA2as="
	"github.com/go-logfmt/logfmt v0.3.0/go.mod h1:Qt1PoO58o5twSAckw1HlFXLmHsOX5/0LbT9GBnD5lWE="
	"github.com/go-logfmt/logfmt v0.4.0/go.mod h1:3RMwSq7FuexP4Kalkev3ejPJsZTpXXBr9+V4qmtdjCk="
	"github.com/go-stack/stack v1.8.0/go.mod h1:v0f6uXyyMGvRgIKkXu+yp6POWl0qKG85gN/melR3HDY="
	"github.com/gogo/protobuf v1.0.0/go.mod h1:r8qH/GZQm5c6nD/R0oafs1akxWv10x8SbQlK7atdtwQ="
	"github.com/gogo/protobuf v1.1.1/go.mod h1:r8qH/GZQm5c6nD/R0oafs1akxWv10x8SbQlK7atdtwQ="
	"github.com/golang/protobuf v1.2.0/go.mod h1:6lQm79b+lXiMfvg/cZm0SGofjICqVBUtrP5yJMmIC1U="
	"github.com/golang/protobuf v1.3.1/go.mod h1:6lQm79b+lXiMfvg/cZm0SGofjICqVBUtrP5yJMmIC1U="
	"github.com/golang/protobuf v1.3.2/go.mod h1:6lQm79b+lXiMfvg/cZm0SGofjICqVBUtrP5yJMmIC1U="
	"github.com/golang/protobuf v1.4.0-rc.1/go.mod h1:ceaxUfeHdC40wWswd/P6IGgMaK3YpKi5j83Wpe3EHw8="
	"github.com/golang/protobuf v1.4.0-rc.1.0.20200221234624-67d41d38c208/go.mod h1:xKAWHe0F5eneWXFV3EuXVDTCmh+JuBKY0li0aMyXATA="
	"github.com/golang/protobuf v1.4.0-rc.2/go.mod h1:LlEzMj4AhA7rCAGe4KMBDvJI+AwstrUpVNzEA03Pprs="
	"github.com/golang/protobuf v1.4.0-rc.4.0.20200313231945-b860323f09d0/go.mod h1:WU3c8KckQ9AFe+yFwt9sWVRKCVIyN9cPHBJSNnbL67w="
	"github.com/golang/protobuf v1.4.0 h1:oOuy+ugB+P/kBdUnG5QaMXSIyJ1q38wWSojYCb3z5VQ="
	"github.com/golang/protobuf v1.4.0/go.mod h1:jodUvKwWbYaEsadDk5Fwe5c77LiNKVO9IDvqG2KuDX0="
	"github.com/golang/protobuf v1.4.2 h1:+Z5KGCizgyZCbGh1KZqA0fcLLkwbsjIzS4aV2v7wJX0="
	"github.com/golang/protobuf v1.4.2/go.mod h1:oDoupMAO8OvCJWAcko0GGGIgR6R6ocIYbsSw735rRwI="
	"github.com/google/go-cmp v0.3.0/go.mod h1:8QqcDgzrUqlUb/G2PQTWiueGozuR1884gddMywk6iLU="
	"github.com/google/go-cmp v0.3.1/go.mod h1:8QqcDgzrUqlUb/G2PQTWiueGozuR1884gddMywk6iLU="
	"github.com/google/go-cmp v0.4.0/go.mod h1:v8dTdLbMG2kIc/vJvl+f65V22dbkXbowE6jgT/gNBxE="
	"github.com/google/gofuzz v1.0.0/go.mod h1:dBl0BpW6vV/+mYPU4Po3pmUjxk6FQPldtuIdl/M65Eg="
	"github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510/go.mod h1:pupxD2MaaD3pAXIBCelhxNneeOaAeabZDe5s4K6zSpQ="
	"github.com/gorilla/context v0.0.0-20160226214623-1ea25387ff6f/go.mod h1:kBGZzfjB9CEq2AlWe17Uuf7NDRt0dE0s8S51q0aT7Yg="
	"github.com/gorilla/mux v1.6.1/go.mod h1:1lud6UwP+6orDFRuTfBEV8e9/aOM/c4fVVCaMa2zaAs="
	"github.com/gorilla/websocket v1.2.0 h1:VJtLvh6VQym50czpZzx07z/kw9EgAxI3x1ZB8taTMQQ="
	"github.com/gorilla/websocket v1.2.0/go.mod h1:E7qHFY5m1UJ88s3WnNqhKjPHQ0heANvMoAMk2YaljkQ="
	"github.com/gorilla/websocket v1.4.2 h1:+/TMaTYc4QFitKJxsQ7Yye35DkWvkdLcvGKqM+x0Ufc="
	"github.com/gorilla/websocket v1.4.2/go.mod h1:YR8l580nyteQvAITg2hZ9XVh4b55+EU/adAjf1fMHhE="
	"github.com/hashicorp/golang-lru v0.5.0 h1:CL2msUPvZTLb5O648aiLNJw3hnBxN2+1Jq8rCOH9wdo="
	"github.com/hashicorp/golang-lru v0.5.0/go.mod h1:/m3WP610KZHVQ1SGc6re/UDhFvYD7pJ4Ao+sR/qLZy8="
	"github.com/hashicorp/golang-lru v0.5.4 h1:YDjusn29QI/Das2iO9M0BHnIbxPeyuCHsjMW+lJfyTc="
	"github.com/hashicorp/golang-lru v0.5.4/go.mod h1:iADmTwqILo4mZ8BN3D2Q6+9jd8WM5uGBxy+E8yxSoD4="
	"github.com/jbenet/go-context v0.0.0-20150711004518-d14ea06fba99 h1:BQSFePA1RWJOlocH6Fxy8MmwDt+yVQYULKfN0RoTN8A="
	"github.com/jbenet/go-context v0.0.0-20150711004518-d14ea06fba99/go.mod h1:1lJo3i6rXxKeerYnT8Nvf0QmHCRC1n8sfWVwXF2Frvo="
	"github.com/jessevdk/go-flags v1.4.0/go.mod h1:4FA24M0QyGHXBuZZK/XkWh8h0e1EYbRYJSGM75WSRxI="
	"github.com/json-iterator/go v1.1.6/go.mod h1:+SdeFBvtyEkXs7REEP0seUULqWtbJapLOCVDaaPEHmU="
	"github.com/json-iterator/go v1.1.9/go.mod h1:KdQUCv79m/52Kvf8AW2vK1V8akMuk1QjK/uOdHXbAo4="
	"github.com/julienschmidt/httprouter v1.2.0/go.mod h1:SYymIcj16QtmaHHD7aYtjjsJG7VTCxuUUipMqKk8s4w="
	"github.com/kevinburke/ssh_config v0.0.0-20190725054713-01f96b0aa0cd h1:Coekwdh0v2wtGp9Gmz1Ze3eVRAWJMLokvN3QjdzCHLY="
	"github.com/kevinburke/ssh_config v0.0.0-20190725054713-01f96b0aa0cd/go.mod h1:CT57kijsi8u/K/BOFA39wgDQJ9CxiF4nAY/ojJ6r6mM="
	"github.com/konsorten/go-windows-terminal-sequences v1.0.1/go.mod h1:T0+1ngSBFLxvqU3pZ+m/2kptfBszLMUkC4ZK/EgS/cQ="
	"github.com/kr/logfmt v0.0.0-20140226030751-b84e30acd515/go.mod h1:+0opPa2QZZtGFBFZlji/RkVcI2GknAs/DXo4wKdlNEc="
	"github.com/kr/pretty v0.1.0/go.mod h1:dAy3ld7l9f0ibDNOQOHHMYYIIbhfbHSm3C4ZsoJORNo="
	"github.com/kr/pty v1.1.1/go.mod h1:pFQYn66WHrOpPYNljwOMqo10TkYh1fy3cYio2l3bCsQ="
	"github.com/kr/text v0.1.0/go.mod h1:4Jbv+DJW3UT/LiOwJeYQe1efqtUx/iVham/4vfdArNI="
	"github.com/kr/text v0.2.0/go.mod h1:eLer722TekiGuMkidMxC/pM04lWEeraHUUmBw8l2grE="
	"github.com/lann/builder v0.0.0-20180802200727-47ae307949d0 h1:SOEGU9fKiNWd/HOJuq6+3iTQz8KNCLtVX6idSoTLdUw="
	"github.com/lann/builder v0.0.0-20180802200727-47ae307949d0/go.mod h1:dXGbAdH5GtBTC4WfIxhKZfyBF/HBFgRZSWwZ9g/He9o="
	"github.com/lann/ps v0.0.0-20150810152359-62de8c46ede0 h1:P6pPBnrTSX3DEVR4fDembhRWSsG5rVo6hYhAB/ADZrk="
	"github.com/lann/ps v0.0.0-20150810152359-62de8c46ede0/go.mod h1:vmVJ0l/dxyfGW6FmdpVm2joNMFikkuWg0EoCKLGUMNw="
	"github.com/lib/pq v1.5.2 h1:yTSXVswvWUOQ3k1sd7vJfDrbSl8lKuscqFJRqjC0ifw="
	"github.com/lib/pq v1.5.2/go.mod h1:5WUZQaWbwv1U+lTReE5YruASi9Al49XbQIvNi/34Woo="
	"github.com/logrusorgru/aurora v0.0.0-20200102142835-e9ef32dff381/go.mod h1:7rIyQOR62GCctdiQpZ/zOJlFyk6y+94wXzv6RNZgaR4="
	"github.com/martinlindhe/base36 v1.0.0 h1:eYsumTah144C0A8P1T/AVSUk5ZoLnhfYFM3OGQxB52A="
	"github.com/martinlindhe/base36 v1.0.0/go.mod h1:+AtEs8xrBpCeYgSLoY/aJ6Wf37jtBuR0s35750M27+8="
	"github.com/matryer/moq v0.0.0-20200106131100-75d0ddfc0007 h1:reVOUXwnhsYv/8UqjvhrMOu5CNT9UapHFLbQ2JcXsmg="
	"github.com/matryer/moq v0.0.0-20200106131100-75d0ddfc0007/go.mod h1:9ELz6aaclSIGnZBoaSLZ3NAl1VTufbOrXBPvtcy6WiQ="
	"github.com/matryer/moq v0.0.0-20200310130814-7721994d1b54 h1:p8zN0Xu28xyEkPpqLbFXAnjdgBVvTJCpfOtoDf/+/RQ="
	"github.com/matryer/moq v0.0.0-20200310130814-7721994d1b54/go.mod h1:9ELz6aaclSIGnZBoaSLZ3NAl1VTufbOrXBPvtcy6WiQ="
	"github.com/mattn/go-colorable v0.1.4/go.mod h1:U0ppj6V5qS13XJ6of8GYAs25YV2eR4EVcfRqFIhoBtE="
	"github.com/mattn/go-isatty v0.0.8/go.mod h1:Iq45c/XA43vh69/j3iqttzPXn0bhXyGjM0Hdxcsrc5s="
	"github.com/mattn/go-isatty v0.0.12/go.mod h1:cbi8OIDigv2wuxKPP5vlRcQ1OAZbq2CE4Kysco4FUpU="
	"github.com/matttproud/golang_protobuf_extensions v1.0.1 h1:4hp9jkHxhMHkqkrB3Ix0jegS5sx/RkqARlsWZ6pIwiU="
	"github.com/matttproud/golang_protobuf_extensions v1.0.1/go.mod h1:D8He9yQNgCq6Z5Ld7szi9bcBfOoFv/3dc6xSMkL2PC0="
	"github.com/mitchellh/go-homedir v1.1.0 h1:lukF9ziXFxDFPkA1vsr5zpc1XuPDn/wFntq5mG+4E0Y="
	"github.com/mitchellh/go-homedir v1.1.0/go.mod h1:SfyaCUpYCn1Vlf4IUYiD9fPX4A5wJrkLzIz1N1q0pr0="
	"github.com/mitchellh/mapstructure v0.0.0-20180203102830-a4e142e9c047 h1:zCoDWFD5nrJJVjbXiDZcVhOBSzKn3o9LgRLLMRNuru8="
	"github.com/mitchellh/mapstructure v0.0.0-20180203102830-a4e142e9c047/go.mod h1:FVVH3fgwuzCH5S8UJGiWEs2h04kUh9fWfEaFds41c1Y="
	"github.com/mitchellh/mapstructure v1.3.0 h1:iDwIio/3gk2QtLLEsqU5lInaMzos0hDTz8a6lazSFVw="
	"github.com/mitchellh/mapstructure v1.3.0/go.mod h1:bFUtVrKA4DC2yAKiSyO/QUcy7e+RRV2QTWOzhPopBRo="
	"github.com/mitchellh/mapstructure v1.3.1 h1:cCBH2gTD2K0OtLlv/Y5H01VQCqmlDxz30kS5Y5bqfLA="
	"github.com/mitchellh/mapstructure v1.3.1/go.mod h1:bFUtVrKA4DC2yAKiSyO/QUcy7e+RRV2QTWOzhPopBRo="
	"github.com/modern-go/concurrent v0.0.0-20180228061459-e0a39a4cb421/go.mod h1:6dJC0mAP4ikYIbvyc7fijjWJddQyLn8Ig3JB5CqoB9Q="
	"github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd/go.mod h1:6dJC0mAP4ikYIbvyc7fijjWJddQyLn8Ig3JB5CqoB9Q="
	"github.com/modern-go/reflect2 v0.0.0-20180701023420-4b7aa43c6742/go.mod h1:bx2lNnkwVCuqBIxFjflWJWanXIb3RllmbCylyMrvgv0="
	"github.com/modern-go/reflect2 v1.0.1/go.mod h1:bx2lNnkwVCuqBIxFjflWJWanXIb3RllmbCylyMrvgv0="
	"github.com/mwitkow/go-conntrack v0.0.0-20161129095857-cc309e4a2223/go.mod h1:qRWi+5nqEBWmkhHvq77mSJWrCKwh8bxhgT7d/eI7P4U="
	"github.com/niemeyer/pretty v0.0.0-20200227124842-a10e7caefd8e/go.mod h1:zD1mROLANZcx1PVRCS0qkT7pwLkGfwJo4zjcN/Tysno="
	"github.com/opentracing/basictracer-go v1.0.0/go.mod h1:QfBfYuafItcjQuMwinw9GhYKwFXS9KnPs5lxoYwgW74="
	"github.com/opentracing/opentracing-go v1.0.2/go.mod h1:UkNAQd3GIcIGf0SeVgPpRdFStlNbqXla1AfSYxPUl2o="
	"github.com/pkg/errors v0.8.0/go.mod h1:bwawxfHBFNV+L2hUp1rHADufV3IMtnDRdf1r5NINEl0="
	"github.com/pkg/errors v0.8.1 h1:iURUrRGxPUNPdy5/HRSm+Yj6okJ6UtLINN0Q9M4+h3I="
	"github.com/pkg/errors v0.8.1/go.mod h1:bwawxfHBFNV+L2hUp1rHADufV3IMtnDRdf1r5NINEl0="
	"github.com/pkg/errors v0.9.1 h1:FEBLx1zS214owpjy7qsBeixbURkuhQAwrK5UwLGTwt4="
	"github.com/pkg/errors v0.9.1/go.mod h1:bwawxfHBFNV+L2hUp1rHADufV3IMtnDRdf1r5NINEl0="
	"github.com/pmezard/go-difflib v1.0.0/go.mod h1:iKH77koFhYxTK1pcRnkKkqfTogsbg7gZNVY4sRDYZ/4="
	"github.com/prometheus/client_golang v0.9.1/go.mod h1:7SWBe2y4D6OKWSNQJUaRYU/AaXPKyh/dDVn+NZz0KFw="
	"github.com/prometheus/client_golang v1.0.0/go.mod h1:db9x61etRT2tGnBNRi70OPL5FsnadC4Ky3P0J6CfImo="
	"github.com/prometheus/client_golang v1.6.0 h1:YVPodQOcK15POxhgARIvnDRVpLcuK8mglnMrWfyrw6A="
	"github.com/prometheus/client_golang v1.6.0/go.mod h1:ZLOG9ck3JLRdB5MgO8f+lLTe83AXG6ro35rLTxvnIl4="
	"github.com/prometheus/client_model v0.0.0-20180712105110-5c3871d89910/go.mod h1:MbSGuTsp3dbXC40dX6PRTWyKYBIrTGTE9sqQNg2J8bo="
	"github.com/prometheus/client_model v0.0.0-20190129233127-fd36f4220a90/go.mod h1:xMI15A0UPsDsEKsMN9yxemIoYk6Tm2C1GtYGdfGttqA="
	"github.com/prometheus/client_model v0.2.0 h1:uq5h0d+GuxiXLJLNABMgp2qUWDPiLvgCzz2dUR+/W/M="
	"github.com/prometheus/client_model v0.2.0/go.mod h1:xMI15A0UPsDsEKsMN9yxemIoYk6Tm2C1GtYGdfGttqA="
	"github.com/prometheus/common v0.4.1/go.mod h1:TNfzLD0ON7rHzMJeJkieUDPYmFC7Snx/y86RQel1bk4="
	"github.com/prometheus/common v0.9.1 h1:KOMtN28tlbam3/7ZKEYKHhKoJZYYj3gMH4uc62x7X7U="
	"github.com/prometheus/common v0.9.1/go.mod h1:yhUN8i9wzaXS3w1O07YhxHEBxD+W35wd8bs7vj7HSQ4="
	"github.com/prometheus/common v0.10.0 h1:RyRA7RzGXQZiW+tGMr7sxa85G1z0yOpM1qq5c8lNawc="
	"github.com/prometheus/common v0.10.0/go.mod h1:Tlit/dnDKsSWFlCLTWaA1cyBgKHSMdTB80sz/V91rCo="
	"github.com/prometheus/procfs v0.0.0-20181005140218-185b4288413d/go.mod h1:c3At6R/oaqEKCNdg8wHV1ftS6bRYblBhIjjI8uT2IGk="
	"github.com/prometheus/procfs v0.0.2/go.mod h1:TjEm7ze935MbeOT/UhFTIMYKhuLP4wbCsTZCD3I8kEA="
	"github.com/prometheus/procfs v0.0.11 h1:DhHlBtkHWPYi8O2y31JkK0TF+DGM+51OopZjH/Ia5qI="
	"github.com/prometheus/procfs v0.0.11/go.mod h1:lV6e/gmhEcM9IjHGsFOCxxuZ+z1YqCvr4OA4YeYWdaU="
	"github.com/rs/cors v1.6.0/go.mod h1:gFx+x8UowdsKA9AchylcLynDq+nNFfI8FkUZdN/jGCU="
	"github.com/russross/blackfriday/v2 v2.0.1 h1:lPqVAte+HuHNfhJ/0LC98ESWRz8afy9tM/0RK8m9o+Q="
	"github.com/russross/blackfriday/v2 v2.0.1/go.mod h1:+Rmxgy9KzJVeS9/2gXHxylqXiyQDYRxCVz55jmeOWTM="
	"github.com/sergi/go-diff v1.0.0/go.mod h1:0CfEIISq7TuYL3j771MWULgwwjU+GofnZX9QAmXWZgo="
	"github.com/sergi/go-diff v1.1.0 h1:we8PVUC3FE2uYfodKH/nBHMSetSfHDR6scGdBi+erh0="
	"github.com/sergi/go-diff v1.1.0/go.mod h1:STckp+ISIX8hZLjrqAeVduY0gWCT9IjLuqbuNXdaHfM="
	"github.com/shurcooL/httpfs v0.0.0-20171119174359-809beceb2371/go.mod h1:ZY1cvUeJuFPAdZ/B6v7RHavJWZn2YPVFQ1OSXhCGOkg="
	"github.com/shurcooL/sanitized_anchor_name v1.0.0 h1:PdmoCO6wvbs+7yrJyMORt4/BmY5IYyJwS/kOiWx8mHo="
	"github.com/shurcooL/sanitized_anchor_name v1.0.0/go.mod h1:1NzhyTcUVG4SuEtjjoZeVRXNmyL/1OwPU0+IJeTBvfc="
	"github.com/shurcooL/vfsgen v0.0.0-20180121065927-ffb13db8def0/go.mod h1:TrYk7fJVaAttu97ZZKrO9UbRa8izdowaMIZcxYMbVaw="
	"github.com/sirupsen/logrus v1.2.0/go.mod h1:LxeOpSwHxABJmUn/MG1IvRgCAasNZTLOkJPxbbu5VWo="
	"github.com/sirupsen/logrus v1.4.2/go.mod h1:tLMulIdttU9McNUspp0xgXVQah82FyeX6MwdIuYE2rE="
	"github.com/stretchr/objx v0.1.0/go.mod h1:HFkY916IF+rwdDfMAkV7OtwuqBVzrE8GR6GFx+wExME="
	"github.com/stretchr/objx v0.1.1/go.mod h1:HFkY916IF+rwdDfMAkV7OtwuqBVzrE8GR6GFx+wExME="
	"github.com/stretchr/testify v1.2.1/go.mod h1:a8OnRcib4nhh0OaRAV+Yts87kKdq0PP7pXfy6kDkUVs="
	"github.com/stretchr/testify v1.2.2/go.mod h1:a8OnRcib4nhh0OaRAV+Yts87kKdq0PP7pXfy6kDkUVs="
	"github.com/stretchr/testify v1.3.0/go.mod h1:M5WIy9Dh21IEIfnGCwXGc5bZfKNJtfHm1UVUgZn+9EI="
	"github.com/stretchr/testify v1.4.0/go.mod h1:j7eGeouHqKxXV5pUuKE4zz7dFj8WfuZ+81PSLYec5m4="
	"github.com/urfave/cli/v2 v2.1.1 h1:Qt8FeAtxE/vfdrLmR3rxR6JRE0RoVmbXu8+6kZtYU4k="
	"github.com/urfave/cli/v2 v2.1.1/go.mod h1:SE9GqnLQmjVa0iPEY0f1w3ygNIYcIJ0OKPMoW2caLfQ="
	"github.com/urfave/cli/v2 v2.2.0 h1:JTTnM6wKzdA0Jqodd966MVj4vWbbquZykeX1sKbe2C4="
	"github.com/urfave/cli/v2 v2.2.0/go.mod h1:SE9GqnLQmjVa0iPEY0f1w3ygNIYcIJ0OKPMoW2caLfQ="
	"github.com/vaughan0/go-ini v0.0.0-20130923145212-a98ad7ee00ec h1:DGmKwyZwEB8dI7tbLt/I/gQuP559o/0FrAkHKlQM/Ks="
	"github.com/vaughan0/go-ini v0.0.0-20130923145212-a98ad7ee00ec/go.mod h1:owBmyHYMLkxyrugmfwE/DLJyW8Ro9mkphwuVErQ0iUw="
	"github.com/vektah/dataloaden v0.2.1-0.20190515034641-a19b9a6e7c9e h1:+w0Zm/9gaWpEAyDlU1eKOuk5twTjAjuevXqcJJw8hrg="
	"github.com/vektah/dataloaden v0.2.1-0.20190515034641-a19b9a6e7c9e/go.mod h1:/HUdMve7rvxZma+2ZELQeNh88+003LL7Pf/CZ089j8U="
	"github.com/vektah/dataloaden v0.3.0 h1:ZfVN2QD6swgvp+tDqdH/OIT/wu3Dhu0cus0k5gIZS84="
	"github.com/vektah/dataloaden v0.3.0/go.mod h1:/HUdMve7rvxZma+2ZELQeNh88+003LL7Pf/CZ089j8U="
	"github.com/vektah/gqlparser v1.3.1 h1:8b0IcD3qZKWJQHSzynbDlrtP3IxVydZ2DZepCGofqfU="
	"github.com/vektah/gqlparser v1.3.1/go.mod h1:bkVf0FX+Stjg/MHnm8mEyubuaArhNEqfQhF+OTiAL74="
	"github.com/vektah/gqlparser/v2 v2.0.1 h1:xgl5abVnsd4hkN9rk65OJID9bfcLSMuTaTcZj777q1o="
	"github.com/vektah/gqlparser/v2 v2.0.1/go.mod h1:SyUiHgLATUR8BiYURfTirrTcGpcE+4XkV2se04Px1Ms="
	"github.com/xanzy/ssh-agent v0.2.1 h1:TCbipTQL2JiiCprBWx9frJ2eJlCYT00NmctrHxVAr70="
	"github.com/xanzy/ssh-agent v0.2.1/go.mod h1:mLlQY/MoOhWBj+gOGMQkOeiEvkx+8pJSI+0Bx9h2kr4="
	"github.com/yuin/goldmark v1.1.27/go.mod h1:3hX8gzYuyVAZsxl0MRgGTJEmQBFcNTphYh9decYSb74="
	"golang.org/x/crypto v0.0.0-20180904163835-0709b304e793/go.mod h1:6SG95UA2DQfeDnfUPMdvaQW0Q7yPrPDi9nlGo2tz2b4="
	"golang.org/x/crypto v0.0.0-20190219172222-a4c6cb3142f2/go.mod h1:6SG95UA2DQfeDnfUPMdvaQW0Q7yPrPDi9nlGo2tz2b4="
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod h1:djNgcEr1/C05ACkg1iLfiJU5Ep61QUkGW8qpdssI0+w="
	"golang.org/x/crypto v0.0.0-20191011191535-87dc89f01550/go.mod h1:yigFU9vqHzYiE8UmvKecakEJjdnWj3jj499lnFckfCI="
	"golang.org/x/crypto v0.0.0-20200302210943-78000ba7a073 h1:xMPOj6Pz6UipU1wXLkrtqpHbR0AVFnyPEQq/wRWz9lM="
	"golang.org/x/crypto v0.0.0-20200302210943-78000ba7a073/go.mod h1:LzIPMQfyMNhhGPhUkYOs5KpL4U8rLKemX1yGLhDgUto="
	"golang.org/x/mod v0.1.1-0.20191105210325-c90efee705ee/go.mod h1:QqPTAvyqsEbceGzBzNggFXnrqF1CaUcvgkdR5Ot7KZg="
	"golang.org/x/mod v0.2.0 h1:KU7oHjnv3XNWfa5COkzUifxZmxp1TyI7ImMXqFxLwvQ="
	"golang.org/x/mod v0.2.0/go.mod h1:s0Qsj1ACt9ePp/hMypM3fl4fZqREWJwdYDEqhRiZZUA="
	"golang.org/x/mod v0.3.0 h1:RM4zey1++hCTbCVQfnWeKs9/IEsaBLA8vTkd0WVtmH4="
	"golang.org/x/mod v0.3.0/go.mod h1:s0Qsj1ACt9ePp/hMypM3fl4fZqREWJwdYDEqhRiZZUA="
	"golang.org/x/net v0.0.0-20181114220301-adae6a3d119a/go.mod h1:mL1N/T3taQHkDXs73rZJwtUhF3w3ftmwwsq0BUmARs4="
	"golang.org/x/net v0.0.0-20190311183353-d8887717615a/go.mod h1:t9HGtf8HONx5eT2rtn7q6eTqICYqUVnKs3thJo3Qplg="
	"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3/go.mod h1:t9HGtf8HONx5eT2rtn7q6eTqICYqUVnKs3thJo3Qplg="
	"golang.org/x/net v0.0.0-20190613194153-d28f0bde5980/go.mod h1:z5CRVTTTmAJ677TzLLGU+0bjPO0LkuOLi4/5GtJWs/s="
	"golang.org/x/net v0.0.0-20190620200207-3b0461eec859/go.mod h1:z5CRVTTTmAJ677TzLLGU+0bjPO0LkuOLi4/5GtJWs/s="
	"golang.org/x/net v0.0.0-20200226121028-0de0cce0169b/go.mod h1:z5CRVTTTmAJ677TzLLGU+0bjPO0LkuOLi4/5GtJWs/s="
	"golang.org/x/net v0.0.0-20200301022130-244492dfa37a h1:GuSPYbZzB5/dcLNCwLQLsg3obCJtX9IJhpXkvY7kzk0="
	"golang.org/x/net v0.0.0-20200301022130-244492dfa37a/go.mod h1:z5CRVTTTmAJ677TzLLGU+0bjPO0LkuOLi4/5GtJWs/s="
	"golang.org/x/sync v0.0.0-20181108010431-42b317875d0f/go.mod h1:RxMgew5VJxzue5/jJTE5uejpjVlOe/izrB70Jof72aM="
	"golang.org/x/sync v0.0.0-20181221193216-37e7f081c4d4/go.mod h1:RxMgew5VJxzue5/jJTE5uejpjVlOe/izrB70Jof72aM="
	"golang.org/x/sync v0.0.0-20190423024810-112230192c58/go.mod h1:RxMgew5VJxzue5/jJTE5uejpjVlOe/izrB70Jof72aM="
	"golang.org/x/sync v0.0.0-20190911185100-cd5d95a43a6e/go.mod h1:RxMgew5VJxzue5/jJTE5uejpjVlOe/izrB70Jof72aM="
	"golang.org/x/sys v0.0.0-20180905080454-ebe1bf3edb33/go.mod h1:STP8DvDyc/dI5b8T5hshtkjS+E42TnysNCUPdjciGhY="
	"golang.org/x/sys v0.0.0-20181116152217-5ac8a444bdc5/go.mod h1:STP8DvDyc/dI5b8T5hshtkjS+E42TnysNCUPdjciGhY="
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod h1:STP8DvDyc/dI5b8T5hshtkjS+E42TnysNCUPdjciGhY="
	"golang.org/x/sys v0.0.0-20190221075227-b4e8571b14e0/go.mod h1:STP8DvDyc/dI5b8T5hshtkjS+E42TnysNCUPdjciGhY="
	"golang.org/x/sys v0.0.0-20190222072716-a9d3bda3a223/go.mod h1:STP8DvDyc/dI5b8T5hshtkjS+E42TnysNCUPdjciGhY="
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod h1:h1NjWce9XRLGQEsW7wpKNCjG9DtNlClVuFLEZdDNbEs="
	"golang.org/x/sys v0.0.0-20190422165155-953cdadca894/go.mod h1:h1NjWce9XRLGQEsW7wpKNCjG9DtNlClVuFLEZdDNbEs="
	"golang.org/x/sys v0.0.0-20200106162015-b016eb3dc98e/go.mod h1:h1NjWce9XRLGQEsW7wpKNCjG9DtNlClVuFLEZdDNbEs="
	"golang.org/x/sys v0.0.0-20200116001909-b77594299b42/go.mod h1:h1NjWce9XRLGQEsW7wpKNCjG9DtNlClVuFLEZdDNbEs="
	"golang.org/x/sys v0.0.0-20200302150141-5c8b2ff67527/go.mod h1:h1NjWce9XRLGQEsW7wpKNCjG9DtNlClVuFLEZdDNbEs="
	"golang.org/x/sys v0.0.0-20200420163511-1957bb5e6d1f h1:gWF768j/LaZugp8dyS4UwsslYCYz9XgFxvlgsn0n9H8="
	"golang.org/x/sys v0.0.0-20200420163511-1957bb5e6d1f/go.mod h1:h1NjWce9XRLGQEsW7wpKNCjG9DtNlClVuFLEZdDNbEs="
	"golang.org/x/sys v0.0.0-20200519105757-fe76b779f299 h1:DYfZAGf2WMFjMxbgTjaC+2HC7NkNAQs+6Q8b9WEB/F4="
	"golang.org/x/sys v0.0.0-20200519105757-fe76b779f299/go.mod h1:h1NjWce9XRLGQEsW7wpKNCjG9DtNlClVuFLEZdDNbEs="
	"golang.org/x/sys v0.0.0-20200523222454-059865788121 h1:rITEj+UZHYC927n8GT97eC3zrpzXdb/voyeOuVKS46o="
	"golang.org/x/sys v0.0.0-20200523222454-059865788121/go.mod h1:h1NjWce9XRLGQEsW7wpKNCjG9DtNlClVuFLEZdDNbEs="
	"golang.org/x/text v0.3.0/go.mod h1:NqM8EUOU14njkJ3fqMW+pc6Ldnwhi/IjpwHt7yyuwOQ="
	"golang.org/x/text v0.3.2/go.mod h1:bEr9sfX3Q8Zfm5fL9x+3itogRgK3+ptLWKqgva+5dAk="
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod h1:n7NCudcB/nEzxVGmLbDWY5pfWTLqBcC2KZ6jyYvM4mQ="
	"golang.org/x/tools v0.0.0-20190125232054-d66bd3c5d5a6/go.mod h1:n7NCudcB/nEzxVGmLbDWY5pfWTLqBcC2KZ6jyYvM4mQ="
	"golang.org/x/tools v0.0.0-20190515012406-7d7faa4812bd/go.mod h1:RgjU9mgBXZiqYHBnxXauZ1Gv1EHHAz9KjViQ78xBX0Q="
	"golang.org/x/tools v0.0.0-20191119224855-298f0cb1881e/go.mod h1:b+2E5dAYhXwXZwtnZ6UAqBI28+e2cm9otk0dWdXHAEo="
	"golang.org/x/tools v0.0.0-20200114235610-7ae403b6b589 h1:rjUrONFu4kLchcZTfp3/96bR8bW8dIa8uz3cR5n0cgM="
	"golang.org/x/tools v0.0.0-20200114235610-7ae403b6b589/go.mod h1:TB2adYChydJhpapKDTa4BR/hXlZSLoq2Wpct/0txZ28="
	"golang.org/x/tools v0.0.0-20200519015757-0d0afa43d58a h1:gILuVKC+ZPD6g/tj6zBOdnOH1ZHI0zZ86+KLMogc6/s="
	"golang.org/x/tools v0.0.0-20200519015757-0d0afa43d58a/go.mod h1:EkVYQZoAsY45+roYkvgYkIh4xh/qjgUK9TdY2XT94GE="
	"golang.org/x/xerrors v0.0.0-20190717185122-a985d3407aa7/go.mod h1:I/5z698sn9Ka8TeJc9MKroUUfqBBauWjQqLJ2OPfmY0="
	"golang.org/x/xerrors v0.0.0-20191011141410-1b5146add898/go.mod h1:I/5z698sn9Ka8TeJc9MKroUUfqBBauWjQqLJ2OPfmY0="
	"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543 h1:E7g+9GITq07hpfrRu66IVDexMakfv52eLZ2CXBWiKr4="
	"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543/go.mod h1:I/5z698sn9Ka8TeJc9MKroUUfqBBauWjQqLJ2OPfmY0="
	"google.golang.org/protobuf v0.0.0-20200109180630-ec00e32a8dfd/go.mod h1:DFci5gLYBciE7Vtevhsrf46CRTquxDuWsQurQQe4oz8="
	"google.golang.org/protobuf v0.0.0-20200221191635-4d8936d0db64/go.mod h1:kwYJMbMJ01Woi6D6+Kah6886xMZcty6N08ah7+eCXa0="
	"google.golang.org/protobuf v0.0.0-20200228230310-ab0ca4ff8a60/go.mod h1:cfTl7dwQJ+fmap5saPgwCLgHXTUD7jkjRqWcaiX5VyM="
	"google.golang.org/protobuf v1.20.1-0.20200309200217-e05f789c0967/go.mod h1:A+miEFZTKqfCUM6K7xSMQL9OKL/b6hQv+e19PK+JZNE="
	"google.golang.org/protobuf v1.21.0 h1:qdOKuR/EIArgaWNjetjgTzgVTAZ+S/WXVrq9HW9zimw="
	"google.golang.org/protobuf v1.21.0/go.mod h1:47Nbq4nVaFHyn7ilMalzfO3qCViNmqZ2kzikPIcrTAo="
	"google.golang.org/protobuf v1.23.0 h1:4MY060fB1DLGMB/7MBTLnwQUY6+F09GEiz6SsrNqyzM="
	"google.golang.org/protobuf v1.23.0/go.mod h1:EGpADcykh3NcUnDUJcl1+ZksZNG86OlYog2l/sGQquU="
	"gopkg.in/alecthomas/kingpin.v2 v2.2.6/go.mod h1:FMv+mEhP44yOT+4EoQTLFTRgOQ1FBLkstjWtayDeSgw="
	"gopkg.in/alexcesaro/quotedprintable.v3 v3.0.0-20150716171945-2caba252f4dc h1:2gGKlE2+asNV9m7xrywl36YYNnBG5ZQ0r/BOOxqPpmk="
	"gopkg.in/alexcesaro/quotedprintable.v3 v3.0.0-20150716171945-2caba252f4dc/go.mod h1:m7x9LTH6d71AHyAX77c9yqWCCa3UKHcVEj9y7hAtKDk="
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod h1:Co6ibVJAznAaIkqp8huTwlJQCZ016jof/cbN4VW5Yz0="
	"gopkg.in/check.v1 v1.0.0-20190902080502-41f04d3bba15/go.mod h1:Co6ibVJAznAaIkqp8huTwlJQCZ016jof/cbN4VW5Yz0="
	"gopkg.in/check.v1 v1.0.0-20200227125254-8fa46927fb4f/go.mod h1:Co6ibVJAznAaIkqp8huTwlJQCZ016jof/cbN4VW5Yz0="
	"gopkg.in/mail.v2 v2.3.1 h1:WYFn/oANrAGP2C0dcV6/pbkPzv8yGzqTjPmTeO7qoXk="
	"gopkg.in/mail.v2 v2.3.1/go.mod h1:htwXN1Qh09vZJ1NVKxQqHPBaCBbzKhp5GzuJEA4VJWw="
	"gopkg.in/warnings.v0 v0.1.2 h1:wFXVbFY8DY5/xOe1ECiWdKCzZlxgshcYVNkBHstARME="
	"gopkg.in/warnings.v0 v0.1.2/go.mod h1:jksf8JmL6Qr/oQM2OXTHunEvvTAsrWBLb6OOjuVWRNI="
	"gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI="
	"gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI="
	"gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I="
	"gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI="
	"gopkg.in/yaml.v2 v2.2.5/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI="
	"gopkg.in/yaml.v2 v2.3.0 h1:clyUAQHOM3G0M3f5vQj7LuJrETvjVot3Z5el9nffUtU="
	"gopkg.in/yaml.v2 v2.3.0/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI="
	"sourcegraph.com/sourcegraph/appdash v0.0.0-20180110180208-2cc67fd64755/go.mod h1:hI742Nqp5OhwiqlzhgfbWU4mW4yO10fP+LoT9WOswdU="
	"sourcegraph.com/sourcegraph/appdash-data v0.0.0-20151005221446-73f23eafcf67/go.mod h1:L5q+DGLGOQFpo1snNEkLOJT2d1YTW66rWNzatr3He1k="
)
go-module_set_globals

SRC_URI="
	https://git.sr.ht/~sircmpwn/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	acct-user/srht-meta
	net-libs/nodejs
	dev-lang/sassc"
RDEPEND="${DEPEND}
	dev-python/bcrypt
	dev-python/prometheus_client
	dev-python/PGPy
	dev-python/pystache
	dev-python/qrcode
	dev-python/redis-py
	dev-python/srht
	dev-python/python-sshpubkeys
	dev-python/zxcvbn
	dev-db/redis
	www-servers/gunicorn
	postgres? ( dev-python/psycopg )
	billing? ( dev-python/stripe dev-python/weasyprint )"
BDEPEND=""

IUSE="+postgres billing"

S="${WORKDIR}/${MY_PN}-${PV}"

export PKGVER="${PV}"

src_compile() {
	distutils-r1_src_compile

	cd "${S}/api"
	go build -o metasrht-api
}

src_install() {
	distutils-r1_src_install

	dobin api/metasrht-api

	newinitd "${FILESDIR}/srht-meta-r1" srht-meta
	newinitd "${FILESDIR}/srht-meta-webhooks-r1" srht-meta-webhooks
	newinitd "${FILESDIR}/srht-meta-api" srht-meta-api
	newconfd "${FILESDIR}/srht-meta.conf" srht-meta
	newconfd "${FILESDIR}/srht-meta-api.conf" srht-meta-api
}

pkg_postinst() {
	elog 'Upgrading database...'
	srht-migrate meta.sr.ht -a upgrade head
	metasrht-migrate -a upgrade head
}
