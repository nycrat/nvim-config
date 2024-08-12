return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		opts = {
			variant = "dawn",
			styles = {
				bold = true,
				italic = true,
				transparency = true,
			},
		},
		config = function()
			vim.cmd([[colorscheme rose-pine]])
		end,
	},
}
