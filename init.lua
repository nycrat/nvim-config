require("avah.options")
require("avah.keymaps")
require("avah.commands")
require("avah.lazy")
require("avah.neovide")

-- Set colorscheme

local theme = require("avah.utils").get_theme()

if theme == "dark" then
	vim.cmd("colorscheme nightfox")
else
	vim.cmd("colorscheme dawnfox")
end

local base_statusline_highlights =
	{ "StatusLine", "StatusLineNC", "Tabline", "TabLineFill", "TabLineSel", "Winbar", "WinbarNC" }
for _, hl_group in pairs(base_statusline_highlights) do
	vim.api.nvim_set_hl(0, hl_group, { bg = "none" })
end

-- Bruh

vim.filetype.add({
	extension = {
		mdx = "mdx",
	},
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})
