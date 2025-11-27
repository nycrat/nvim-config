local project_file = vim.fn.getcwd() .. "/project.godot"
if vim.uv.fs_stat(project_file) then
  vim.fn.serverstart "./godothost"
end

local dap = require "dap"

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
