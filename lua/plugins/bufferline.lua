return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  -- event = "VeryLazy", -- 强制插件在启动时加载
  config = function()
      require("bufferline").setup({
      options = {
          -- 启用文件图标
          show_buffer_icons = true,


          -- 启用关闭按钮

          show_close_icon = true,


          -- 显示 git 状态

          diagnostics = "nvim_lsp",


          -- ... 更多配置选项

          always_show_bufferline = true,


          -- 自定义 buffer 编号显示

          numbers = function(opts)
              return string.format('%s', opts.raise(opts.ordinal))
          end,
      },
  })
  end,


  -- 设置快捷键

  keys = {
      -- 添加数字快捷键来切换到对应的 buffer
      {"<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "Go to buffer 1"},
      {"<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", desc = "Go to buffer 2"},
      {"<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", desc = "Go to buffer 3"},
      {"<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", desc = "Go to buffer 4"},
      {"<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", desc = "Go to buffer 5"},
      {"<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>", desc = "Go to buffer 6"},
      {"<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>", desc = "Go to buffer 7"},
      {"<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>", desc = "Go to buffer 8"},
      {"<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>", desc = "Go to buffer 9"},


      {"<leader>0", "<cmd>bdelete<cr>", desc = "delete buffer"},

  },
}