local project_file = vim.fn.getcwd() .. "/project.godot"
if vim.uv.fs_stat(project_file) then
  vim.fn.serverstart "./godothost"
end

local dap, dapui = require("dap"), require("dapui")
dapui.setup {}

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

dap.adapters.godot = {
  type = "server",
  host = "127.0.0.1",
  port = "6006",
}

dap.configurations.gdscript = {
  {
    type = "godot",
    request = "launch",
    name = "Launch scene",
    project = "${workspaceFolder}",
    launch_scene = true,
  }
}
