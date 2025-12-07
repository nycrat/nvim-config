local M = {}

local special_formatting = {}

M.specify_formatter = function(filetype, server)
	special_formatting[filetype] = server

	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("Auto_Formatting", { clear = true }),
		callback = function(ev)
			local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
			if client:supports_method("textDocument/formatting") then
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = ev.buf,
					callback = function()
						if vim.g.autoformat then
							vim.lsp.buf.format({
								async = true,
								filter = function(c)
									if special_formatting[vim.bo.filetype] ~= nil then
										return special_formatting[vim.bo.filetype] == c.name
									end
									return true
								end
							})
						end
					end,
				})
			end
		end
	})
end

return M
