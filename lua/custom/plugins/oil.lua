-- oil
-- https://github.com/stevearc/oil.nvim

vim.pack.add { 'https://github.com/stevearc/oil.nvim' }
require('oil').setup {
  default_file_explorer = false, -- still allow using netrw
  skip_confirm_for_simple_edits = true,
  watch_for_changes = true,
  view_options = {
    show_hidden = true,
    is_always_hidden = function(name, buf) return name == '..' end,
  },
  keymaps = {
    ['<C-l>'] = false,
    ['<C-h>'] = false,
    ['go'] = {
      function() vim.cmd("silent exec '!open " .. require('oil').get_current_dir() .. "'") end,
      desc = 'Open CWD with Default System File Explorer',
    },
  },
}
