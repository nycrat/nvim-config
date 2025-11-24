require "mini.completion".setup {
  delay = { completion = 5, info = 5, signature = 5 },
  mappings = {
    force_twostep = "<c-n>",
  }
}

-- Disables using Enter to complete
vim.keymap.set("i", "<cr>", "<esc>a<cr>")
