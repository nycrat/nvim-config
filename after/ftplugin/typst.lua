vim.opt_local.wrap = true
vim.opt_local.spell = true

local remap_options = { silent = true, buffer = 0, noremap = true }

vim.keymap.set("n", "j", "gj", remap_options)
vim.keymap.set("n", "k", "gk", remap_options)
vim.keymap.set("n", "0", "g0", remap_options)
vim.keymap.set("n", "$", "g$", remap_options)
