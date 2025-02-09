return {
	"nvim-pack/nvim-spectre",
	opts = {
		mapping = {
			["toggle_line"] = {
				map = "VD",
				cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
				desc = "send all items to quickfix",
			},
			["send_to_qf"] = {
				map = "<leader>dd",
				cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
				desc = "send all items to quickfix",
			},
		},
	},
}
