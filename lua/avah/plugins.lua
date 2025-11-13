vim.pack.add {
  "https://github.com/EdenEast/nightfox.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/nvim-telescope/telescope.nvim",
  "nvim-mini/mini.icons",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-mini/mini.surround",
  "https://github.com/nvim-mini/mini.snippets",
  "https://github.com/nvim-mini/mini.pairs",
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/nmac427/guess-indent.nvim",
  "https://github.com/folke/todo-comments.nvim",
  { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/chomosuke/typst-preview.nvim",
  "https://github.com/ray-x/lsp_signature.nvim",
  "https://github.com/kdheepak/lazygit.nvim",
}

require "nightfox".setup {
  options = {
    transparent = true,
  }
}

require "nvim-treesitter.configs".setup {
  ensure_installed = { "lua" },
  highlight = { enable = true }
}

require "telescope".setup {}

require "mini.icons".setup {}
require "mini.surround".setup {}
require "mini.snippets".setup {}
require "mini.pairs".setup {}
require "mason".setup {}
require "oil".setup {}
require "guess-indent".setup {}
require "todo-comments".setup {}
require "lsp_signature".setup {
  hint_prefix = {
    above = "↙ ", -- when the hint is on the line above the current line
    current = "← ", -- when the hint is on the same line
    below = "↖ ", -- when the hint is on the line below the current line
  },
  timer_interval = 0,
}

require "avah.harpoon"
