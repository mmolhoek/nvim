local status_ok, lir = pcall(require, "lir")
if not status_ok then
  return
end

local actions = require "lir.actions"
local mark_actions = require "lir.mark.actions"
local clipboard_actions = require "lir.clipboard.actions"

lir.setup {
  show_hidden_files = false,
  devicons_enable = true,
  mappings = {
    ["<cr>"] = actions.edit,
    ["l"] = actions.edit,
    ["<C-s>"] = actions.split,
    ["v"] = actions.vsplit,
    ["<C-t>"] = actions.tabedit,

    ["h"] = actions.up,
    ["q"] = actions.quit,

    ["A"] = actions.mkdir,
    ["a"] = actions.newfile,
    ["r"] = actions.rename,
    ["@"] = actions.cd,
    ["Y"] = actions.yank_path,
    ["i"] = actions.toggle_show_hidden,
    ["d"] = actions.delete,

    ["J"] = function()
      mark_actions.toggle_mark('n')
      vim.cmd "normal! j"
    end,
    ["c"] = clipboard_actions.copy,
    ["x"] = clipboard_actions.cut,
    ["p"] = clipboard_actions.paste,
  },
  float = {
    winblend = 0,
    curdir_window = {
      enable = false,
      highlight_dirname = true,
    },

    -- -- You can define a function that returns a table to be passed as the third
    -- -- argument of nvim_open_win().
    win_opts = {
      width = math.floor(vim.o.columns * 0.7),
      height = math.floor(vim.o.lines * 0.7),
      border = "rounded",
    }
  },
  hide_cursor = false,
  on_init = function()
    -- use visual mode
    vim.api.nvim_buf_set_keymap(
      0,
      "x",
      "J",
      ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
      { noremap = true, silent = true }
    )

    -- echo cwd
    -- vim.api.nvim_echo({ { vim.fn.expand "%:p", "Normal" } }, false, {})
  end,
}

-- custom folder icon
require("nvim-web-devicons").set_icon {
  lir_folder_icon = {
    icon = "",
    -- color = "#7ebae4",
    -- color = "#569CD6",
    color = "#42A5F5",
    name = "LirFolderNode",
  },
}
