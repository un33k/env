
# Git configuration
# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
# cp git-completion.zsh git/

- Make a .zsh directory
mkdir ~/.zsh

- Copy zsh script into .zsh directory
cp env/osx/home/zsh-* ~/.zsh
cp env/osx/git/git-completion.zsh ~/.zsh
cp env/osx/git/git-prompt.zsh ~/.zsh

- Add GITHUB_KEYS to ~/.zsh/bash-git.sh

- Install Xcode & Install command line tools
   $ xcode-select --install

# To have launchd start postgresql now and restart at login:
# $ brew services start postgresql
# Or, if you don't want/need a background service you can just run:
# $ pg_ctl -D /usr/local/var/postgres start | stop

# To switch between python
# unset PYTHONPATH
