vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- visual options
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.winborder = "bold"
vim.opt.showtabline = 0      -- disable tab bar at top of vim
vim.opt.signcolumn = "yes"   -- always display for gitsigns and lsp diagnostics
vim.opt.scrolloff = 999      -- keep cursor centered vertically as much as possible
vim.opt.inccommand = "split" -- preview search and replace

vim.opt.completeopt = { "fuzzy", "menu", "menuone", "noinsert" }

vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
