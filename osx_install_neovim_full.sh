#!/bin/bash

# check if xcode-tools are installed
if [ "$(xcode-select --version)" == "" ]; then
  echo installing xcode tools
  xcode-select --install
fi
# check if brew is installed
echo installing brew if needed otherwise update
if [[ "$(which -s brew)" == "brew not found" ]] ; then
    echo installing brew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    brew update
    brew upgrade
fi

echo installing neovim and all needed packeges via brew
brew install git neovim stylua pyenv pyenv-virtualenv ninja libtool automake cmake pkg-config gettext curl ripgrep fd gnu-sed shellcheck shfmt zk curl jesseduffield/lazygit/lazygit
echo "alias ls='lazygit'" >> "$HOME"/.zshrc
alias ls='lazygit'

#Python
echo installing python 3.10.7 via pyenv
pyenv install 3.10.7
pyenv global 3.10.7
pip3 install black flake8
/usr/bin/python3 -m pip install pynvim

#Ruby
if [ "$(ruby --version)" == "ruby not found" ]; then
  echo installing ruby
  curl -sSL https://get.rvm.io | bash -s -- --auto-dotfiles
  export PATH="$PATH:$HOME/.rvm/bin"
  rvm install 3.1
  gem install neovim
  gem environment
fi

#nvm/npm
if [[ -f ~/.nvm/nvm.sh ]] ; then
  . $HOME/.nvm/nvm.sh
else
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
fi
nvm install 16.18.0
nvm alias default 16.18.0
nvm use 16.18.0
npm install -g neovim prettier coc-java-lombok ls_emmet

# get 
if [ -d ~/config/nvim ]; then
  TEMPDIR=$(mktemp -d  ~/.config/nvim.bkXXXX)
  echo moving old nvim dir to "$TEMPDIR"
  mv ~/config/nvim "$TEMPDIR"
fi
echo getting nvim from github/mmolhoek
git clone https://github.com/mmolhoek/nvim.git ~/.config/nvim

# java
echo creating the workspace folder for java in ~/.java_workspaces/
echo java stores all cache data here for each project for faster startup times
mkdir -p ~/.java_workspaces
if [[ ! $(which -s sdk) ]] ; then
  echo installing sdk man to install java version
  curl -s "https://get.sdkman.io" | bash
fi
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

echo installing java 17, change later if your want, use sdk env for that
sdk install java 17.0.4-amzn

echo "in each project your should use **sdk use java 17.0.4-amzn** and **sdk env init**"

echo installing java debugger
pushd ~/.config/nvim || exit
  if [ ! -d "java-debug" ]; then
    git clone -q https://github.com/microsoft/java-debug.git
  fi
  pushd java-debug || exit
    git pull
    sdk use java 17.0.4-amzn  
    .mvnw clean install
  popd || exit 1
  if [ ! -d "vscode-java-test" ]; then
    git clone -q https://github.com/microsoft/vscode-java-test.git
  fi
  pushd vscode-java-test || exit
    git pull
    npm i
    npm run build-plugin
  popd || exit 1
popd || exit 1

echo adding tags to global gitignore

if [ -f "$HOME/.gitignore" ]; then
  if ! grep -q tags "$HOME/.gitignore"; then
    echo "tags*" >> ~/.gitignore
  fi
else
  printf "node_modules\ntags*\n" > ~/.gitignore
fi
git config --global core.excludesfile ~/.gitignore

echo ready to go. but to make it work you have to start like this:
echo nvim ~/.config/nvim/lua/user/plugins.lua  and when open do the write command ':w'
echo nvim will install all needed plugins. let it finish. then exit and restart with nvim
echo next: test if :checkhealth reports all is fine. fix those that are complaining.
echo make sure you have selected a java version with sdk use java 17.0.4-amzn before you start nvim
