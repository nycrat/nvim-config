vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("gen.options")
require("gen.plugins")
require("gen.lsp")
require("gen.cmp")
require("gen.dap")
require("gen.commands")
require("gen.keymaps")
require("gen.theme")

require("lang.godot")
require("lang.typst")
require("lang.cpp")
