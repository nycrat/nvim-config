local harpoon = require("harpoon")
local extensions = require("harpoon.extensions");

-- from https://github.com/ThePrimeagen/harpoon/issues/662#issuecomment-3493869362
local function get_key_with_branch()
  local branch = vim.fn.system("git branch --show-current")
  local cwd = vim.loop.cwd()
  if branch then
    cwd = cwd .. "::" .. branch
  end
  return cwd
end

-- Only load key once per neovim launch for performance
local current_key = get_key_with_branch()

harpoon:setup({
  settings = {
    key = function() return current_key end,
  },
})
harpoon:extend(extensions.builtins.highlight_current_file())

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
