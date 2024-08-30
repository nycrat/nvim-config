return {
	{ -- Autoformat
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>mm",
				function()
					-- require("conform").format({ async = true, lsp_fallback = true })
					vim.g.disable_autoformat = not vim.g.disable_autoformat
					if vim.g.disable_autoformat then
						print("Autoformat Disabled")
					else
						print("Autoformat Enabled")
					end
				end,
				mode = "n",
			},
			{
				"<leader>mf",
				function()
					-- require("conform").format({ async = true, lsp_fallback = true })
					print(vim.inspect(require("conform").list_all_formatters()))
				end,
				mode = "n",
			},
		},
		opts = {
			notify_on_error = true,
			notify_no_formatters = true,
			format_on_save = function(bufnr)
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end

				-- local disable_filetypes = { c = true, cpp = true }
				local disable_filetypes = {}
				return {
					timeout_ms = 500,
					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				markdown = { "prettierd" },
				html = { "prettierd" },
				yaml = { "prettierd" },
			},
		},
	},
}
