vim.pack.add({
  "https://github.com/nvimtools/none-ls.nvim",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/rafamadriz/friendly-snippets",
  "https://github.com/nvim-treesitter/nvim-treesitter"
})

vim.lsp.enable { "lua_ls", "gopls", "astro", "ts_ls", "cssls", "pylsp", "html",
  "clangd", "tailwindcss", "tinymist", "gdscript", "rust_analyzer",
  "mdx_analyzer" }

require "nvim-treesitter.configs".setup {
  auto_install = true,
}

require "mason".setup {}

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      }
    }
  }
})

vim.lsp.config("tinymist", {
  settings = {
    formatterMode = "typstfmt"
  },
})

local null_ls = require "null-ls"

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.prettier
  }
}

vim.g.autoformat = true

local special_formatting = {
  css = "null-ls",
  html = "null-ls",
}

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    if client:supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = ev.buf,
        callback = function()
          if vim.g.autoformat then
            vim.lsp.buf.format({
              async = true,
              filter = function(c)
                if special_formatting[vim.bo.filetype] ~= nil then
                  return special_formatting[vim.bo.filetype] == c.name
                end
                return true
              end
            })
          end
        end,
      })
    end
  end
})
