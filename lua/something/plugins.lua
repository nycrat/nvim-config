require("packer").startup(function()
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-tree/nvim-web-devicons")

	use({ "neoclide/coc.nvim", branch = "release" })
	use("jiangmiao/auto-pairs")
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	use({
		"kyazdani42/nvim-tree.lua",
		requires = { "nvim-tree/nvim-web-devicons" },
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})
	use("nvim-telescope/telescope.nvim")

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	use({ "nycrat/rose-pine", as = "rose-pine" })
end)
