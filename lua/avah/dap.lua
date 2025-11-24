vim.pack.add {
  "https://github.com/mfussenegger/nvim-dap",
  "https://github.com/rcarriga/nvim-dap-ui",
  "https://github.com/nvim-neotest/nvim-nio",
  "https://github.com/theHamsta/nvim-dap-virtual-text",
  "https://github.com/leoluz/nvim-dap-go",
}

local project_file = vim.fn.getcwd() .. "/project.godot"
if vim.uv.fs_stat(project_file) then
  vim.fn.serverstart "./godothost"
end

local dap, dapui = require "dap", require "dapui"
require "nvim-dap-virtual-text".setup {}
require "dapui".setup {}

dap.listeners.before.attach.dapui_config = dapui.open
dap.listeners.before.launch.dapui_config = dapui.open
dap.listeners.before.event_terminated.dapui_config = dapui.close
dap.listeners.before.event_exited.dapui_config = dapui.close

vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F10>", dap.step_over)
vim.keymap.set("n", "<F11>", dap.step_into)
vim.keymap.set("n", "<F12>", dap.step_out)
vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<Leader>dB", function() dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end)
-- vim.keymap.set("n", "<Leader>dr", dap.repl.open)
vim.keymap.set("n", "<Leader>dl", dap.run_last)
vim.keymap.set("n", "<Leader>du", dapui.toggle)

vim.keymap.set("n", "<Leader>dt", require "dap-go".debug_test)

-- vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
--   require("dap.ui.widgets").hover()
-- end)
-- vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
--   require("dap.ui.widgets").preview()
-- end)
-- vim.keymap.set("n", "<Leader>df", function()
--   local widgets = require("dap.ui.widgets")
--   widgets.centered_float(widgets.frames)
-- end)
-- vim.keymap.set("n", "<Leader>ds", function()
--   local widgets = require("dap.ui.widgets")
--   widgets.centered_float(widgets.scopes)
-- end)

require "dap-go".setup {}
