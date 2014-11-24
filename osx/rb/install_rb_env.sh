# update version with latest of ruby, install brew and run this on a new osx

VERSION=2.0.0p481
brew update
brew install rbenv ruby-build rbenv-vars readline ctags
if [ -n "${ZSH_VERSION:-}" ]; then
  echo 'eval "$(rbenv init - --no-rehash)"' >> ~/.zshrc
else
  echo 'eval "$(rbenv init - --no-rehash)"' >> ~/.bash_profile
fi
eval "$(rbenv init - --no-rehash)" # load rbenv in the current shell
CONFIGURE_OPTS="--disable-install-doc --with-readline-dir=$(brew --prefix readline)" rbenv install $VERSION
rbenv global $VERSION
gem install --no-ri --no-rdoc bundler rbenv-rehash git-up hitch gem-browse gem-ctags cheat awesome_print pry
gem ctags