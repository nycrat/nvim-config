local project_file = vim.fn.getcwd() .. "/project.godot"
if vim.uv.fs_stat(project_file) then
  print("godot")
  vim.fn.serverstart "./godothost"
end
