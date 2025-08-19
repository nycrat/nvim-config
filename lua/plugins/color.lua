return {
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		options = {
			transparent = true,
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
	-- 	"xiyaowong/transparent.nvim",
	-- 	lazy = false,
	-- 	config = function()
	-- 		-- require("transparent").clear_prefix("lualine")
	-- 	end,
	-- },
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
	-- 		-- make color different from cursor
	-- 		if os.getenv("THEME") == "dark" then
	-- 			vim.api.nvim_set_hl(0, "MatchParen", { bg = "#2d3f67" })
	-- 		else
	-- 			vim.api.nvim_set_hl(0, "MatchParen", { bg = "#ded1db" })
	-- 		end
	-- 	end,
	-- },
}
