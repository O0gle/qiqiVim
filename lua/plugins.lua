local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local function load_plugin_specs()
  local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"
  local plugin_files = vim.fn.readdir(plugin_dir, [[v:val =~ '\.lua$']])

  table.sort(plugin_files)

  local specs = {}
  for _, file in ipairs(plugin_files) do
    local module = "plugins." .. file:gsub("%.lua$", "")
    specs[#specs + 1] = require(module)
  end

  return specs
end

require("lazy").setup(load_plugin_specs())
