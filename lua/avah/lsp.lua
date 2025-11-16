vim.lsp.enable { "lua_ls", "gopls", "astro", "ts_ls", "cssls", "pylsp", "html", "clangd", "tailwindcss", "tinymist" }

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      }
    }
  }
})

vim.g.autoformat = true

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    if vim.g.autoformat then
      vim.lsp.buf.format({ async = true })
    end
  end
})
