return {
	{
		"uga-rosa/ccc.nvim",
		config = function()
			local ccc = require("ccc")
			ccc.setup({
				highlighter = {
					auto_enable = true,
					lsp = true,
				},
				lsp = true,
				save_on_quit = true,
				inputs = {
					ccc.input.rgb,
					ccc.input.oklch,
				},
				outputs = {
					ccc.output.hex,
					ccc.output.css_rgb,
					ccc.output.css_oklch,
				},
			})
		end,
	},
}
