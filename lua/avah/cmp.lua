require "mini.completion".setup {
  delay = { completion = 5, info = 5, signature = 5 },
  mappings = {
    force_twostep = "<c-n>",
  }
}

-- Disables using Enter to complete
vim.keymap.set("i", "<cr>", function()
  if vim.fn.pumvisible() then
    return vim.keycode "<c-e><cr>"
  else
    return vim.keycode "<cr>"
  end
end, { expr = true })
