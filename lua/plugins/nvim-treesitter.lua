return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
      require("nvim-treesitter.configs").setup({
          ensure_installed = { "c", "cpp", "c_sharp", "kotlin" },
          highlight = { enable = true },
      })
  end,
}