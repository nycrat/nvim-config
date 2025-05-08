vim.api.nvim_create_user_command("TP", function()
	vim.cmd([[TypstPreview]])
end, {})
