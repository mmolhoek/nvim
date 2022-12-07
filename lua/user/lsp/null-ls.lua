local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- https://github.com/prettier-solidity/prettier-plugin-solidity
-- npm install --save-dev prettier prettier-plugin-solidity

-- require("null-ls").disable({"prettier"})
-- prettier is implecitly loaded via eslint_d plugin. eslintrc.js in your project
-- is the place to include prettier. see:
-- https://medium.com/@jimeno0/eslint-and-prettier-in-vim-neovim-7e45f85cf8f9

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup {
    debug = false,
    sources = {
        formatting.eslint_d,
        formatting.black.with { extra_args = { "--fast" } },
        formatting.stylua,
        formatting.shfmt,
        -- formatting.google_java_format, //not used anymore, using format in ftplugin/java.lua
        -- diagnostics.flake8,
        diagnostics.shellcheck,
    },
    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                   vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
}

local unwrap = {
  method = null_ls.methods.DIAGNOSTICS,
  filetypes = { "rust" },
  generator = {
    fn = function(params)
      local diags = {}
      -- sources have access to a params object
      -- containing info about the current file and editor state
      for i, line in ipairs(params.content) do
        local col, end_col = line:find "unwrap()"
        if col and end_col then
          -- null-ls fills in undefined positions
          -- and converts source diagnostics into the required format
          table.insert(diags, {
            row = i,
            col = col,
            end_col = end_col,
            source = "unwrap",
            message = "hey " .. os.getenv("USER") .. ", don't forget to handle this" ,
            severity = 2,
          })
        end
      end
      return diags
    end,
  },
}

null_ls.register(unwrap)
