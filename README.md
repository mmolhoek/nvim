# My Neovim Config

A while back I started a new job at DPG (De PersGroep), a Belgian company as a Backend NodeJS developer. But they also asked me to write in java.
At the company they all use IntelliJ, but I am used to Vim and wanted to see if it was possible to write and debug java with vim.

After some research I found out that someone named [Christian Chiarulli](https://github.com/ChristianChiarulli/nvim) got java up and running in the latest Neovim

He has a [nice video](https://www.youtube.com/watch?v=0q_MKUynUck&ab_channel=chris%40machine) about how to set Java up in Neovim which you should have a look at.

As I had not used Neovim before, being a vim user I decided this was the moment for me to switch to Neovim. I cloned [Christian Chiarulli](https://github.com/ChristianChiarulli/nvim)'s nvim config
as it is the most complete version I could find (Thank you Christian!) and activated the java plugin as described in [his video](https://www.youtube.com/watch?v=0q_MKUynUck&ab_channel=chris%40machine).
I also did some refactoring on the settings and added a [script](./osx_install_neovim_full.sh) that installs everything you need to get it working on OSX.

btw, you need to have at a good shell (I use ZSH (brew install zsh), [Oh my ZSH](https://ohmyz.sh/) shell) and a good term (brew install iterm).

to install on **OSX** just start a term and run ./osx_install_neovim_full.sh

The script will move the current .config/nvim out of the way into a tempdir, clone this remove, and install a bunch of apps via brew you need

Run `nvim` and wait for the plugins to be installed

**NOTE:** (You will notice treesitter pulling in a bunch of parsers the next time you open Neovim)

## Get healthy

Open `nvim` and enter the following:

```
:checkhealth
```

make sure all is green and you will be ready to go
