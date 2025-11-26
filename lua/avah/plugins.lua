vim.pack.add {
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/nmac427/guess-indent.nvim",
  "https://github.com/folke/todo-comments.nvim",
  { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/chomosuke/typst-preview.nvim",
  "https://github.com/kdheepak/lazygit.nvim",
  "https://github.com/nvim-pack/nvim-spectre",
  "https://github.com/windwp/nvim-ts-autotag",
  "https://github.com/rafamadriz/friendly-snippets"
}


require "nvim-ts-autotag".setup {}

require "nvim-treesitter.configs".setup {
  auto_install = true,
}

require "mini.pick".setup {}

require "mini.icons".setup {}
MiniIcons.tweak_lsp_kind()
MiniIcons.mock_nvim_web_devicons()

require "mini.surround".setup {}
require "mini.snippets".setup {}
require "mini.pairs".setup {}
require "mini.statusline".setup {}
require "mini.notify".setup {}

local gen_loader = require "mini.snippets".gen_loader

require "mini.snippets".setup {
  snippets = {
    gen_loader.from_lang()
  }
}

MiniSnippets.start_lsp_server()

require "mason".setup {}
require "oil".setup {
  skip_confirm_for_simple_edits = true,
  watch_for_changes = true,
  view_options = {
    show_hidden = true,
    is_always_hidden = function(name, buf)
      return name == ".."
    end
  }
}
require "guess-indent".setup {}
require "todo-comments".setup {}

require "avah.harpoon"
