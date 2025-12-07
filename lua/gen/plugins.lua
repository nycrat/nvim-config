vim.pack.add {
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/stevearc/oil.nvim",

  { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },

  "https://github.com/nvim-pack/nvim-spectre",
  "https://github.com/kdheepak/lazygit.nvim",

  "https://github.com/windwp/nvim-ts-autotag",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/nmac427/guess-indent.nvim",

  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/Aasim-A/scrollEOF.nvim",
}


require "nvim-ts-autotag".setup {}

require "mini.icons".setup {}
MiniIcons.tweak_lsp_kind()
MiniIcons.mock_nvim_web_devicons()

require "mini.pick".setup {}
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

require "oil".setup {
  skip_confirm_for_simple_edits = true,
  watch_for_changes = true,
  view_options = {
    show_hidden = true,
    is_always_hidden = function(name, buf)
      return name == ".."
    end
  },
  keymaps = {
    ["<C-l>"] = false,
    ["<C-h>"] = false,
  }
}
require "guess-indent".setup {}
require "scrollEOF".setup {
  insert_mode = true,
}

require "gen.harpoon"
