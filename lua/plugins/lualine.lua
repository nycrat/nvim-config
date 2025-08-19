local avah_theme = {
	normal = {
		a = {},
		b = {},
		c = {},
		x = {},
		y = {},
		z = {},
	},
}

return {
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				theme = avah_theme,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				globalstatus = true,
			},
			sections = {
				lualine_a = {},
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					{
						"filename",
						path = 1,
					},
				},
				lualine_x = { "filetype" },
				lualine_y = { "location" },
				lualine_z = {},
			},
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}
