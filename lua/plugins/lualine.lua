return {
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			sections = {
				lualine_c = {
					{
						"filename",
						path = 1,
					},
				},
			},
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}
