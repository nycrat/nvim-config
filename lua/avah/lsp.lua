vim.lsp.enable { "lua_ls", "gopls", "astro", "ts_ls", "cssls", "pylsp" }

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      }
    }
  }
})

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format({ async = true })
  end
})
