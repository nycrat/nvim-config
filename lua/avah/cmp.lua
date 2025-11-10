vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })

      local function feedkeys(keys)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, false, true), 'n', true)
      end

      local function pumvisible()
        return tonumber(vim.fn.pumvisible()) ~= 0
      end

      vim.keymap.set("i", "<C-n>", function()
        if pumvisible() then
          feedkeys "<C-n>"
        else
          if next(vim.lsp.get_clients { bufnr = 0 }) then
            vim.lsp.completion.get()
          else
            if vim.bo.omnifunc == "" then
              feedkeys "<C-x><C-n>"
            else
              feedkeys "<C-x><C-o>"
            end
          end
        end
      end)
    end
  end
})

-- vim.cmd "set completeopt+=noselect"
