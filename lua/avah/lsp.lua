vim.lsp.enable { "lua_ls", "gopls", "astro", "ts_ls", "cssls", "pylsp", "html", "clangd", "tailwindcss", "tinymist", "gdscript" }

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

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
      local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    if client:supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = ev.buf,
        callback = function()
          if vim.g.autoformat then
            vim.lsp.buf.format({ async = true })
          end
        end,
      })
    end
  end
})
