return {
  "NeogitOrg/neogit",
  dependencies = {
      "nvim-lua/plenary.nvim",       -- required
      "sindrets/diffview.nvim",       -- optional - Diff integration


  -- Only one of these is needed.

      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua",             -- optional
      "echasnovski/mini.pick",       -- optional
  },


  -- 使用 keys 选项实现延迟加载

  keys = {
      { "<leader>gs", function() require("neogit").open() end, desc = "Neogit Status" }
  },


  config = function()

      require("neogit").setup({
          -- 可以在这里进行 Neogit 的配置
      })
  end,
}