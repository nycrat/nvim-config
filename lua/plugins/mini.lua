return {
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			keywords = {
				TK = { icon = " ", color = "info" },
			},
			highlight = {
				comments_only = false,
				pattern = [[.*<(KEYWORDS)\s*]], -- vim regex
			},
			search = {
				pattern = [[\b(KEYWORDS)]], -- ripgrep regex
			},
		},
	},
	{ -- Collection of various small independent plugins/modules
		"echasnovski/mini.nvim",
		config = function()
			-- Better Around/Inside textobjects
			--
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
			--  - ci'  - [C]hange [I]nside [']quote
			require("mini.ai").setup({ n_lines = 500 })

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup({
				mappings = {
					replace = "sc",
				},
			})

			require("mini.indentscope").setup({
				draw = {
					delay = 0,
				},
				symbol = "⏐",
			})

			require("mini.pairs").setup({})

			--  Check out: https://github.com/echasnovski/mini.nvim
		end,
	},
}
