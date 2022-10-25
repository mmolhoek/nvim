#!/bin/bash

# check if brew is installed
echo installing brew if needed otherwise update
if [[ ! $(which -s brew) ]] ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo brew update
fi

echo installing neovim and all needed packees via brew
brew install neovim stylua pyenv pyenv-virtualenv ninja libtool automake cmake pkg-config gettext curl ripgrep fd gnu-sed shellcheck shfmt zk curl jesseduffield/lazygit/lazygit

#Python
echo installing python 3.10.7 via pyenv
pyenv install 3.10.7
pyenv global 3.10.7
pip3 install black flake8


#nvm/npm
if [[ ! $(which -s nvm) ]] ; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
fi
nvm install 16.18.0
nvm alias default 16.18.0
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
echo installing java 17, change later if your want, use sdk env for that
sdk install java 17.0.4-amzn

echo "in each project your should use **sdk use java 17.0.4-amzn** and **sdk env init**"

echo installing java debugger
pushd ~/.config/nvim || exit
  git clone https://github.com/microsoft/java-debug.git
  pushd java-debug || exit
    sdk use java 17.0.4-amzn  
    .mvnw clean install
  popd || exit 1
  git clone https://github.com/microsoft/vscode-java-test.git
  pushd vscode-java-test || exit
    npm i
    npm run build-plugin
  popd || exit 1
popd || exit 1

echo ready to go. run nvim and it will auto install a lot of packages the first time. let it install. on errors, quit rerun it until it is quit
echo also test if :checkhealth reports all is fine. fix if not
echo make sure you have selected a java version with sdk use java 17.0.4-amzn before you start nvim
