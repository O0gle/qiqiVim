return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
      require("toggleterm").setup({
      shell = "pwsh.exe",
          -- 设置终端窗口在底部，高度为屏幕高度的40%
          direction = "float", -- 终端打开方向，可以是 "float", "horizontal", "vertical"
          -- size = 20, -- 终端窗口的大小
          -- 更多配置选项
      })
  end,


  -- 设置快捷键

  keys = {
      -- 按 <leader>tf 切换浮动终端
      {"<leader><leader>t", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle Floating Terminal"},
  },
}
