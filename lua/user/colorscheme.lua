-- local colorscheme = "darkplus"
local colorscheme = "darkplus"

vim.g.onedarker_italic_keywords = false

vim.g.onedarker_italic_functions = false

vim.g.onedarker_italic_comments = true

vim.g.onedarker_italic_loops = false

vim.g.onedarker_italic_conditionals = false

local status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not status_ok then
  -- vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

-- Set transparent background to see sweep keyboard layout that i set as desktop backround image

-- Function to enable the highlights
vim.g.enable_transparent = function()
  vim.cmd "highlight Normal guibg=none"
  vim.cmd "highlight NonText guibg=none"
  vim.g.normal_transparency_enabled = true
  vim.notify "Transparent background enabled"
end
-- notify

-- Function to disable the highlights
vim.g.disable_transparent = function()
  vim.cmd "highlight Normal guibg=NONE"
  vim.cmd "highlight NonText guibg=NONE"
  vim.g.normal_transparency_enabled = false
  vim.notify "Transparent background disabled"
end
-- Initialize the highlights
vim.g.enable_transparent()
-- Define a command to toggle the highlights
vim.cmd "command! ToggleTransparency lua if vim.g.normal_transparency_enabled then vim.g.disable_transparent() else vim.g.enable_transparent() end"
