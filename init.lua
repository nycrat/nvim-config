require("avah.options")
require("avah.keymaps")
require("avah.lazy")

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		print("Welcome to Neovim !")
	end,
})

-- Set colorscheme

local theme = require("avah.utils").get_theme()

if theme == "dark" then
	vim.cmd("colorscheme nightfox")
else
	vim.cmd("colorscheme dawnfox")
end

-- Bruh

vim.filetype.add({
	extension = {
		mdx = "mdx",
	},
})
