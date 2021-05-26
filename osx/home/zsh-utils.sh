# This formula is keg-only, which means it was not symlinked into /usr/local,
# because Apple has deprecated use of OpenSSL in favor of its own TLS and crypto libraries.
export CFLAGS="$CFLAGS -I${BREW_DIR}/opt/openssl/include -L${BREW_DIR}/opt/openssl/lib"
export PATH="${BREW_DIR}/opt/openssl/bin:$PATH"

# qt related
export PATH="${BREW_DIR}/opt/qt/bin:$PATH"
export LDFLAGS="-L${BREW_DIR}/opt/qt/lib"
export CPPFLAGS="-I${BREW_DIR}/opt/qt/include"

# For compilers to find readline you may need to set
export LDFLAGS="-L${BREW_DIR}/opt/readline/include/lib"
export CPPFLAGS="-I${BREW_DIR}/opt/readline/include/include"
