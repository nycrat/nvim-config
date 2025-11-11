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

map("n", "<leader>p", "<cmd>Telescope find_files<cr>")
map("n", "<leader>x", "<cmd>Telescope live_grep<cr>")
map({ "n", "x", "v" }, "<leader>y", "\"+y")
map("i", "jk", "<esc>")

map("n", "<c-h>", "<c-w><c-h>")
map("n", "<c-j>", "<c-w><c-j>")
map("n", "<c-k>", "<c-w><c-k>")
map("n", "<c-l>", "<c-w><c-l>")

map("n", "<esc>", "<cmd>nohlsearch<cr>")

map("n", "<leader>lf", vim.lsp.buf.format)

map("n", "<leader>rp", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

map({ "n", "i" }, "<c-f>", "<cmd>silent !tmux neww tmux-sessionizer<cr>")

map("n", "<leader>ca", vim.lsp.buf.code_action)
map("n", "<leader>rn", vim.lsp.buf.rename)
