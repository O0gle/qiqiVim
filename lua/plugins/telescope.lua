return {
  -- 添加 telescope.nvim 插件
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },


  keys = {

      { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
  },
  config = function()
    -- 设置 telescope 的快捷键
    -- local builtin = require("telescope.builtin")
    -- vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = "Find files" })
    -- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live Grep" })
    -- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find Buffers" })
    -- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help Tags" })
   
    -- 增加配置：默认忽略隐藏文件和目录
  require("telescope").setup({
      defaults = {
          file_ignore_patterns = { "%.git", "^.git/", "node_modules", "%.vs", "^.vs/" },
      mappings = {
              i = {
                  ["<C-n>"] = "move_selection_next",
                  ["<C-p>"] = "move_selection_previous",
              },
          },
      },
  })
  end,
}