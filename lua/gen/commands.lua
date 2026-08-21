local build_commands = {
	c = "!/opt/homebrew/opt/llvm/bin/clang++ -std=c++23 -Wall -O2 -o %:p:r.o %",
	cpp = "!/opt/homebrew/opt/llvm/bin/clang++ -std=c++23 -Wall -O2 -o %:p:r.o %",
	rust = "!cargo build --release",
	go = "!go build",
	javascript = "",
}

local run_commands = {
	c = "%:p:r.o",
	cpp = "%:p:r.o",
	rust = "cargo run --release",
	go = "go run .",
	javascript = "node %",
	python = "python3 %",
}

vim.api.nvim_create_user_command("Build", function()
	local filetype = vim.bo.filetype

	for file, command in pairs(build_commands) do
		if filetype == file then
			vim.cmd(command)
			break
		end
	end
end, {})

vim.api.nvim_create_user_command("Run", function()
	local filetype = vim.bo.filetype

	for file, command in pairs(run_commands) do
		if filetype == file then
			vim.cmd("sp")
			vim.cmd("term " .. command)
			vim.cmd("resize 20N")
			local keys = vim.api.nvim_replace_termcodes("i", true, false, true)
			vim.api.nvim_feedkeys(keys, "n", false)
			break
		end
	end
end, {})

vim.api.nvim_create_user_command("BuildAndRun", function()
	vim.cmd([[Build]])
	vim.cmd([[Run]])
end, {})

vim.api.nvim_create_user_command("LspStop", function(opts)
	local filter = { bufnr = 0 }
	if opts.args ~= "" then
		filter = { name = opts.args }
	end

	local clients = vim.lsp.get_clients(filter)
	if #clients == 0 then
		vim.notify("No matching LSP clients found running.", vim.log.levels.WARN)
		return
	end

	for _, client in ipairs(clients) do
		vim.lsp.stop_client(client.id)
		vim.notify("Stopped LSP client: " .. client.name, vim.log.levels.INFO)
	end
end, {
	nargs = "?",
	desc = "Stop active LSP clients (current buffer or by name)",
	complete = function()
		local names = {}
		for _, client in ipairs(vim.lsp.get_clients()) do
			table.insert(names, client.name)
		end
		return names
	end,
})

vim.api.nvim_create_user_command("LspRestart", function(opts)
	local filter = { bufnr = 0 }
	if opts.args ~= "" then
		filter = { name = opts.args }
	end

	local clients = vim.lsp.get_clients(filter)
	if #clients == 0 then
		vim.notify("No active LSP clients found to restart.", vim.log.levels.WARN)
		return
	end

	for _, client in ipairs(clients) do
		local config = client.config
		local bufs = vim.lsp.get_buffers_by_client_id(client.id)

		vim.lsp.stop_client(client.id)

		-- Wait for the client to fully stop before launching a new instance
		vim.defer_fn(function()
			local new_client_id = vim.lsp.start(config)
			if new_client_id then
				for _, bufnr in ipairs(bufs) do
					if vim.api.nvim_buf_is_valid(bufnr) then
						vim.lsp.buf_attach_client(bufnr, new_client_id)
					end
				end
				vim.notify("Restarted LSP client: " .. client.name, vim.log.levels.INFO)
			end
		end, 100) -- Short delay ensures a clean shutdown/startup loop
	end
end, {
	nargs = "?",
	desc = "Restart active LSP clients (current buffer or by name)",
	complete = function()
		local names = {}
		for _, client in ipairs(vim.lsp.get_clients()) do
			table.insert(names, client.name)
		end
		return names
	end,
})

vim.api.nvim_create_user_command("LspStart", function(opts)
	-- Trigger filetype events to force standard auto-commands to attach configured LSPs
	if opts.args == "" then
		local ft = vim.bo.filetype
		if ft ~= "" then
			vim.cmd("set filetype=" .. ft)
			vim.notify("Triggered autocommands to start LSP for filetype: " .. ft, vim.log.levels.INFO)
		else
			vim.notify("Current buffer has no filetype set.", vim.log.levels.WARN)
		end
	else
		vim.notify(
			"LspStart argument targeting is not fully native without explicit configurations.",
			vim.log.levels.ERROR
		)
	end
end, {
	nargs = "?",
	desc = "Manually start/attach LSP servers for the current buffer's filetype",
})
