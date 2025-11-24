vim.opt.smartindent = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.showtabline = 0
vim.opt.showmatch = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = false

vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
-- vim.opt.guicursor = "a:block"

vim.opt.updatetime = 20
vim.opt.scrolloff = 999
vim.opt.background = "light"

vim.opt.inccommand = "split"
vim.opt.wrap = false

-- vim.opt.cmdheight = 0

vim.opt.winborder = "rounded"
vim.opt.completeopt = { "menu", "menuone", "noinsert" }
