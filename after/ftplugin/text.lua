vim.opt_local.wrap = true
vim.opt_local.spell = true

local remap_options = { silent = true, buffer = 0, noremap = true }

-- for mode in { "n", "x" } do
-- end

for _, mode in ipairs({ "n", "x" }) do
	for _, key in ipairs({ "j", "k", "0", "$" }) do
		vim.keymap.set(mode, key, "g" .. key, remap_options)
	end
end
