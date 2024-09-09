return {
	{
		"stevearc/oil.nvim",
		opts = {
			skip_confirm_for_simple_edits = true,
			prompt_save_on_select_new_entry = false,
			watch_for_changes = true,
			delete_to_trash = true,
			view_options = {
				show_hidden = true,
			},
			keymaps = {
				["<C-s>"] = {
					function()
						local split_file = require("oil").get_cursor_entry().parsed_name
						local dir = require("oil").get_current_dir(0)
						require("oil").close()
						vim.cmd("vs")
						vim.cmd("e " .. dir .. split_file)
					end,
					desc = "Open File in Split and Reopen Previous Buffer",
				},
				["gy"] = {
					function()
						local file = require("oil").get_cursor_entry().parsed_name
						local dir = require("oil").get_current_dir(0)
						vim.fn.setreg("+", dir .. file)
					end,
					desc = "Copy Entry Name to System Clipboard",
				},
				[")"] = {
					function()
						require("oil").select()
					end,
					desc = "Select Current Entry",
				},
				["<leader><c-o>"] = {
					function()
						vim.cmd("silent exec '!open " .. require("oil").get_current_dir() .. "'")
					end,
					desc = "Open CWD with Default System File Explorer",
				},
			},
		},
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
		},
	},
}
