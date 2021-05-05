export NPM_TOKEN="add-your-npmjs-token-here"

# You like yarn over npm
export PATH="$HOME/.yarn/bin:$PATH"

function load_nvm {
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

load_nvm