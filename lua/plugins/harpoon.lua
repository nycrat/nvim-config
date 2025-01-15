return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		config = function()
			local harpoon = require("harpoon")

			harpoon:setup()

			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
			end)
			vim.keymap.set("n", "<leader>e", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			for i = 1, 9, 1 do
				vim.keymap.set("n", "<leader>" .. tostring(i), function()
					harpoon:list():select(i)
				end)
			end

			vim.keymap.set("n", "<c-p>", function()
				harpoon:list():prev()
			end)
			vim.keymap.set("n", "<c-n>", function()
				harpoon:list():next()
			end)

			vim.api.nvim_create_autocmd({ "BufEnter" }, {
				desc = "Source ftplugin/$1.lua to override Issue #626",
				group = vim.api.nvim_create_augroup("Harpoon_Optlocal", { clear = true }),
				callback = function()
					local ft = vim.bo.filetype
					vim.cmd("silent! source ~/.config/nvim/after/ftplugin/" .. ft .. ".lua")
				end,
			})
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}
