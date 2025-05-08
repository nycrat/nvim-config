local options = {
	smartindent = true,
	tabstop = 2,
	shiftwidth = 2,
	expandtab = true,
	showtabline = 0,
	showmatch = true,

	number = true,
	relativenumber = true,

	splitbelow = true,
	splitright = true,

	ignorecase = true,
	smartcase = true,
	termguicolors = true,
	signcolumn = "yes",
	-- showmode = false,
	-- errorbells = false,
	-- wrap = false,
	cursorline = false,

	writebackup = false,
	swapfile = false,
	undodir = os.getenv("HOME") .. "/.vim/undodir",
	undofile = true,
	guicursor = "a:block",

	updatetime = 20,
	scrolloff = 999,
	background = os.getenv("THEME") or "light",

	inccommand = "split",
	wrap = false,
}

vim.g.mapleader = " "

for option, value in pairs(options) do
	vim.opt[option] = value
end
