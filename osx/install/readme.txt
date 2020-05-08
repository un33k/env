
# Git configuration
# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
# cp git-completion.zsh git/

# Git prompt configuration
# https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/gitfast/git-prompt.sh
# cp git-prompt.sh git/

- Make a .zsh directory
mkdir ~/.zsh

- Copy zsh script into .zsh directory
cp env/osx/home/zsh-* ~/.zsh
cp env/osx/git/git-completion.zsh ~/.zsh
cp env/osx/git/git-prompt.zsh ~/.zsh

- Add GITHUB_KEYS to ~/.zsh/bash-git.sh

- Install Xcode & Install command line tools
   $ xcode-select --install
