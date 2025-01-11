return {
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		options = {
			colorblind = {
				enable = true,
				severity = {
					protan = 0,
					deutan = 1,
					tritan = 0,
				},
			},
		},
	},
	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {
	-- 		variant = "dawn",
	-- 		styles = {
	-- 			bold = true,
	-- 			italic = true,
	-- 			transparency = true,
	-- 		},
	-- 	},
	-- 	config = function()
	-- 		vim.api.nvim_set_hl(0, "Pmenu", { bg = "None" })
	-- 		vim.api.nvim_set_hl(0, "PmenuKind", { bg = "None" })
	-- 		vim.api.nvim_set_hl(0, "PmenuExtra", { bg = "None" })
	-- 		vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "None" })
	--
	-- 		-- make color different from cursor
	-- 		if os.getenv("THEME") == "dark" then
	-- 			vim.api.nvim_set_hl(0, "MatchParen", { bg = "#2d3f67" })
	-- 		else
	-- 			vim.api.nvim_set_hl(0, "MatchParen", { bg = "#ded1db" })
	-- 		end
	-- 	end,
	-- },
}
