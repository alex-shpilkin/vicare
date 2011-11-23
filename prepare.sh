# prepare.sh --
#
# Run this to rebuild the infrastructure and configure.

set -xe

(set -xe ;  cd .. && sh BUILD-THE-INFRASTRUCTURE.sh)

prefix=/usr/local
LIBFFI_INCLUDEDIR=${prefix}/lib/libffi-3.0.8/include

../configure \
    --config-cache                              \
    --prefix="${prefix}"                        \
    --enable-libffi                             \
    CFLAGS='-O3 -march=i686 -mtune=i686'        \
    CPPFLAGS="-I${LIBFFI_INCLUDEDIR}"           \
    LDFLAGS='-L/usr/local/lib -lpthread'        \
    "$@"

### end of file
