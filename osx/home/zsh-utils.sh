# This formula is keg-only, which means it was not symlinked into /usr/local,
# because Apple has deprecated use of OpenSSL in favor of its own TLS and crypto libraries.
export CFLAGS="$CFLAGS -I/usr/local/opt/openssl/include -L/usr/local/opt/openssl/lib"
export PATH="/usr/local/opt/openssl/bin:$PATH"

# qt related
export PATH="/usr/local/opt/qt/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/qt/lib"
export CPPFLAGS="-I/usr/local/opt/qt/include"
