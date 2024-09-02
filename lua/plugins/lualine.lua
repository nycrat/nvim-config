return {
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			sections = {
				lualine_a = {},
				lualine_b = { "branch", "diagnostics" },
				lualine_c = {
					{
						"filename",
						path = 1,
					},
				},
				lualine_x = {},
				lualine_y = {},
			},
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}
