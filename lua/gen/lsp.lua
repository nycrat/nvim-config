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

vim.g.autoformat = true

local null_ls = require "null-ls"

null_ls.setup {}
null_ls.register(null_ls.builtins.formatting.prettier)

local helpers = require "gen.helpers"

helpers.specify_formatter("css", "null-ls")
helpers.specify_formatter("html", "null-ls")
