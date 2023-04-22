vim.g.python3_host_prog = "/Users/molhoe000/.pyenv/shims/python"
vim.o.relativenumber = true
vim.g.markdown_fenced_languages = { "javascript", "typescript", "css", "html" }

-- make pressing jk and kj be escape so your findgers do not move from keyboard
vim.keymap.set("i", "jk", "<Esc>", options)
vim.keymap.set("i", "kj", "<Esc>", options)
-- make pressing df and fd be Backspace to remove typo (not sure if this workd yet)
vim.keymap.set("i", "df", "<Bs>", options)
vim.keymap.set("i", "fd", "<Bs>", options)
require "user.hot-reload"
require "user.keymaps"
require "user.plugins"
require "user.autocommands"
require "user.colorscheme"
require "user.cmp"
require "user.navic"
-- require "user.lsp-inlayhints"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.gitsigns"
require "user.nvim-tree"
reload "user.lualine"
require "user.toggleterm"
require "user.project"
require "user.impatient"
require "user.indentline"
require "user.alpha"
require "user.whichkey"
require "user.hop"
require "user.matchup"
require "user.numb"
require "user.dial"
require "user.colorizer"
require "user.spectre"
require "user.zen-mode"
require "user.neoscroll"
require "user.todo-comments"
require "user.bookmark"
require "user.symbol-outline"
require "user.git-blame"
require "user.gist"
require "user.gitlinker"
require "user.notify"
require "user.ts-context"
require "user.registers"
-- require "user.sniprun"
require "user.functions"
require "user.illuminate"
require "user.dap"
require "user.lir"
require "user.cybu"
require "user.winbar"
require "user.options"
require "user.nvim-webdev-icons"
require "user.bfs"
require "user.crates"
require "user.dressing"
require "user.tabout"
require "user.fidget"
require "user.browse"
require "user.auto-session"
require "user.jaq"
require "user.surround"
require "user.harpoon"
require "user.lab"
require "user.vim-slash"
-- require "user.copilot"
require "user.rest"
