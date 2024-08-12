require("avah.options")
require("avah.keymaps")
require("avah.lazy")

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		print("Welcome to Neovim !")
	end,
})
