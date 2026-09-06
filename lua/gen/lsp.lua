vim.lsp.log.set_level(vim.log.levels.OFF)

vim.pack.add({
  "https://github.com/nvimtools/none-ls.nvim",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/rafamadriz/friendly-snippets",
  "https://github.com/nvim-treesitter/nvim-treesitter"
})

require "nvim-treesitter".setup {}
require "mason".setup {}
require "mason-lspconfig".setup {
  automatic_enable = true
}

vim.diagnostic.config {
  -- virtual_lines = true,
  virtual_text = true,
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
  }
}

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

vim.g.autoformat = false

local null_ls = require "null-ls"

null_ls.setup {}
null_ls.register(null_ls.builtins.formatting.prettier)

local helpers = require "gen.helpers"

helpers.specify_formatter("css", "null-ls")
helpers.specify_formatter("html", "null-ls")
helpers.specify_formatter("typescript", "null-ls")
helpers.specify_formatter("typescriptreact", "null-ls")
