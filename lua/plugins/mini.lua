return {
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
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
			require("mini.surround").setup()

			require("mini.indentscope").setup({
				symbol = "⏐",
			})

			require("mini.pairs").setup({})

			-- require("mini.starter").setup({
			-- 	items = {
			-- 		{ action = "Telescope find_files", name = "Find Files", section = "Telescope" },
			-- 		{ action = "Telescope live_grep", name = "Live Grep", section = "Telescope" },
			-- 	},
			-- 	footer = "Another day of using Neovim :)",
			-- 	query_updaters = "",
			-- })
			--
			-- local buf_id = vim.api.nvim_get_current_buf()
			--
			-- if buf_id == nil or not vim.api.nvim_buf_is_valid(buf_id) then
			-- 	buf_id = vim.api.nvim_create_buf(false, true)
			-- end
			--
			-- local buf_keymap = function(key, cmd)
			-- 	vim.keymap.set(
			-- 		"n",
			-- 		key,
			-- 		("<Cmd>lua %s<CR>"):format(cmd),
			-- 		{ buffer = buf_id, nowait = true, silent = true }
			-- 	)
			-- end
			--
			-- buf_keymap("k", [[MiniStarter.update_current_item('prev')]])
			-- buf_keymap("j", [[MiniStarter.update_current_item('next')]])

			--  Check out: https://github.com/echasnovski/mini.nvim
		end,
	},
}
