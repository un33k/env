# This formula is keg-only, which means it was not symlinked into /usr/local,
# because Apple has deprecated use of OpenSSL in favor of its own TLS and crypto libraries.
export CFLAGS="$CFLAGS -I/opt/homebrew/opt/openssl/include -L/opt/homebrew/opt/openssl/lib"
export PATH="/opt/homebrew/opt/openssl/bin:$PATH"

# qt related
export PATH="/opt/homebrew/opt/qt/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/qt/lib"
export CPPFLAGS="-I/opt/homebrew/opt/qt/include"

# For compilers to find readline you may need to set
export LDFLAGS="-L/opt/homebrew/opt/readline/include/lib"
export CPPFLAGS="-I/opt/homebrew/opt/readline/include/include"
