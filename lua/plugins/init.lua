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



-- 加载所有插件配置

require("lazy").setup({
  require("plugins.theme"),
  require("plugins.bufferline"),
  require("plugins.hop"),
  require("plugins.indent-blankline"),
  require("plugins.lualine"),
--   require("plugins.nvim-cmp"),
  require("plugins.mason"),
  require("plugins.mason-lspconfig"),
  require("plugins.neogit"),
  require("plugins.nvim-surround"),
  require("plugins.nvim-tree"),
  require("plugins.nvim-treesitter"),
  require("plugins.telescope"),
  require("plugins.toggleterm"),
  require("plugins.markdown"),
})


