-- For copilot.vim disable all but...
-- vim.g.copilot_filetypes = {
--   ["*"] = false,
-- java =  true
-- }

-- vim.cmd [[
--   imap <silent><script><expr> <C-A> copilot#Accept("\<CR>")
--   let g:copilot_no_tab_map = v:true
-- ]]

local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
  return
end

copilot.setup {
  cmp = {
    enabled = true,
    method = "getCompletionsCycling",
  },
  panel = { -- no config options yet
    enabled = true,
  },
  ft_disable = { "markdown" },
  -- plugin_manager_path = vim.fn.stdpath "data" .. "/site/pack/packer",
  server_opts_overrides = {
    -- trace = "verbose",
    settings = {
      advanced = {
        -- listCount = 10, -- #completions for panel
        inlineSuggestCount = 5, -- #completions for getCompletions
      },
    },
  },
}
-- change the highlight
-- vim.cmd [[highlight Copilotsuggestion guifg=#8f8347 ctermfg=8]]
vim.cmd [[imap <silent><script><expr> <S-Right> copilot#Next()]]
vim.cmd [[imap <silent><script><expr> <S-Left> copilot#Previous()]]
-- we do not want tab to accept as harpoon uses tab, use s-a
vim.cmd [[imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")]]
vim.g.copilot_no_tab_map = true

