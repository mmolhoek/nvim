-- vim.g.registers_return_symbol = "\n" --'⏎' by default
-- vim.g.registers_tab_symbol = "\t" --'·' by default
-- vim.g.registers_space_symbol = " " --' ' by default
local registers = require("registers")
registers.setup({
  hide_only_registers = true,
  show_empty_registers = true,
  trim_whitespace = true,
  hide_only_whitespace = true,
  registers_delay = false,
  registers_register_key_sleep = false,
  registers_insert_mode = true,
  registers_normal_mode = true,
  registers_visual_mode = true,
  window = {
    border = "rounded",
    min_height = 3,
    max_width = 100

  }
})
