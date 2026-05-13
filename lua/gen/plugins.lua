vim.pack.add {
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/stevearc/oil.nvim",

  { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },

  "https://github.com/nvim-pack/nvim-spectre",

  "https://github.com/windwp/nvim-ts-autotag",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/nmac427/guess-indent.nvim",

  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/Aasim-A/scrollEOF.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter-context",
}


require "nvim-ts-autotag".setup {}

require "mini.icons".setup {}
MiniIcons.tweak_lsp_kind()
MiniIcons.mock_nvim_web_devicons()

local win_config = function()
  local height = math.floor(0.6 * vim.o.lines)
  local width = math.floor(0.6 * vim.o.columns)
  return {
    anchor = 'NW',
    height = height,
    width = width,
    row = math.floor(0.5 * (vim.o.lines - height)),
    col = math.floor(0.5 * (vim.o.columns - width)),
  }
end

require "mini.pick".setup {
  window = {
    config = win_config
  },
}
require "mini.extra".setup {}
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
    ["go"] = {
      function()
        vim.cmd("silent exec '!open " .. require("oil").get_current_dir() .. "'")
      end,
      desc = "Open CWD with Default System File Explorer",
    },
  }
}
require "guess-indent".setup {}
require "scrollEOF".setup {
  insert_mode = true,
}
require "treesitter-context".setup {
  max_lines = 2,
  enable = false,
}

require "gen.harpoon"
