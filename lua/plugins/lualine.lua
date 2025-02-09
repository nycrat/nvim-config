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
				lualine_x = { "filetype" },
				lualine_y = {
					function()
						if vim.fn.getfsize(vim.fn.expand("%")) > 1 * 1000 * 1000 then
							return "too many words"
						end
						local word_count = vim.fn.wordcount()
						if word_count.visual_words then
							return word_count.visual_words .. " words"
						else
							return word_count.words .. " words"
						end
					end,
				},
			},
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}
