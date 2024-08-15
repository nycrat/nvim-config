local remap = require("something.keymap")

local nnoremap = remap.nnoremap
local inoremap = remap.inoremap

vim.g.mapleader = " "

nnoremap("<leader>e", ":NvimTreeToggle<CR>")

nnoremap("<leader>p", ":lua require('telescope.builtin').find_files()<CR>")
nnoremap("<leader>x", ":lua require('telescope.builtin').live_grep()<CR>")
nnoremap("<leader>b", ":lua require('telescope.builtin').buffers()<CR>")

inoremap("jk", "<Esc>")

nnoremap("<leader>rn", "<Plug>(coc-rename)", { silent = true })
nnoremap("<leader>ff", "<Plug>(coc-definition)", { silent = true })

nnoremap("K", "<Cmd>call CocActionAsync('doHover')<CR>", { silent = true })

inoremap("<C-l>", "coc#refresh()", { silent = true, expr = true })
