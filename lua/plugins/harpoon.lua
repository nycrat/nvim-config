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
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}
