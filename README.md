# My Neovim Config

A while back I started a new job at DPG (De PersGroep), a Belgian company as a Backend NodeJS developer. But they also asked me to write in java. At the company they all use IntelliJ, but I am used to Vim and wanted to see if it was possible to write and debug java with vim.

After some research I found out that someone named [Christian Chiarulli](https://github.com/ChristianChiarulli/nvim) got java up and running in the latest Neovim

He has a [nice video](https://www.youtube.com/watch?v=0q_MKUynUck&ab_channel=chris%40machine) about how to set Java up in Neovim which you should have a look at.

As I had not used Neovim before, being a vim user I decided this was the moment for me to switch to Neovim. I cloned [Christian Chiarulli](https://github.com/ChristianChiarulli/nvim)'s nvim config as it is the most complete version I could find (Thank you Christian!) and activated the java plugin as described in [his video](https://www.youtube.com/watch?v=0q_MKUynUck&ab_channel=chris%40machine). I also did some refactoring on the settings and added a [script](./osx_install_neovim_full.sh) that installs everything you need to get it working on OSX.

BTW, you need to have at a good shell (I use ZSH (brew install zsh), [Oh my ZSH](https://ohmyz.sh/) shell) and a good term (brew install iterm). Actually, you should use dotfiles to have everything setup.

To install on **OSX**, goto your favorite terminal, then:

```
cd ~/.config
# backup your old settings if you have them
[ -d nvim ] && mv nvim nvim.bak 
# get this repo
git clone git@github.com:mmolhoek/nvim.git
# or over https
git clone https://github.com/mmolhoek/nvim.git
cd nvim
./osx_install_neovim_full.sh
```

The script will install a bunch of apps via brew you will need to run nvim properly

Run `nvim lua/user/plugins.lua` and do a ':w' to trigger the installation of all plugins, if it does not do that already...wait for the plugins to be installed

**NOTE:** (You will notice treesitter pulling in a bunch of parsers the next time you open Neovim)

## Get healthy

Open `nvim` and enter the following:

```
:checkhealth
```

make sure all is green and you will be ready to go
