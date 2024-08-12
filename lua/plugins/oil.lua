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
		},
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
		},
	},
}
