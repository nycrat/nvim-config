local map = vim.keymap.set

map("n", "<leader>w", "<cmd>write<cr>")
map("n", "<leader>q", "<cmd>quit<cr>")

map("n", "<leader><tab>", function()
	if vim.bo.filetype ~= "oil" then
		require("oil").open()
	else
		require("oil").close()
	end
end)

map("n", "-", require("oil").open)

map("n", "<leader>p", "<cmd>Pick files<cr>")
map("n", "<leader>x", "<cmd>Pick grep_live<cr>")
map("n", "<leader>gb", "<cmd>Gitsigns blame<cr>")
map({ "n", "x", "v" }, "<leader>y", '"+y')
map("i", "jk", "<esc>")

map("n", "<c-h>", "<c-w><c-h>")
map("n", "<c-j>", "<c-w><c-j>")
map("n", "<c-k>", "<c-w><c-k>")
map("n", "<c-l>", "<c-w><c-l>")

map("n", "<esc>", "<cmd>nohlsearch<cr>")

map("n", "<leader>rp", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

map({ "n", "i" }, "<c-f>", "<cmd>silent !tmux neww tmux-sessionizer<cr>")

map("n", "<leader>ca", vim.lsp.buf.code_action)
map("n", "<leader>rn", vim.lsp.buf.rename)
map("n", "<leader>ff", vim.lsp.buf.definition)
map("n", "<leader>fd", vim.lsp.buf.declaration)
map("n", "<leader>fi", vim.lsp.buf.implementation)
map("n", "<leader>fr", vim.lsp.buf.references)

map("n", "<leader>lf", vim.lsp.buf.format)
map("n", "<leader>lt", function()
	vim.g.autoformat = not vim.g.autoformat
	if vim.g.autoformat then
		print("Autoformat enabled")
	else
		print("Autoformat disabled")
	end
end)

map("n", "<leader>cb", "<Cmd>Build<CR>")
map("n", "<leader>cl", "<Cmd>Run<CR>")
map("n", "<leader>cr", "<Cmd>BuildAndRun<CR>")

map("n", "<leader>tc", require("treesitter-context").toggle)
map("n", "<leader>ti", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end)
