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

	termguicolors = true,
	signcolumn = "yes",
	-- showmode = false,
	-- errorbells = false,
	-- wrap = false,
	cursorline = true,

	writebackup = false,
	swapfile = false,
	undodir = os.getenv("HOME") .. "/.vim/undodir",
	undofile = true,

	updatetime = 20,
	scrolloff = 15,
	background = "light",
}

-- vim.opt.nrformats:append("alpha") -- increment letters
-- vim.opt.shortmess:append("IsF")

-- vim.o.shortmess = "filnxstToOFS"

vim.g.mapleader = " "

for option, value in pairs(options) do
	vim.opt[option] = value
end
