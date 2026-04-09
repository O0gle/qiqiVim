return {
  "phaazon/hop.nvim",
  version = "*",
  keys = {
      { "<leader><leader>f", function() require("hop").hint_char1() end, desc = "Hop: Single character jump" },
      { "<leader><leader>w", function() require("hop").hint_words() end, desc = "Hop: Word jump" },
  },
  config = function()
      require("hop").setup({
      keys = "etovxqpdygfblzhckisuran", -- 自定义跳转字符
      term_seq = {
          -- 终端模式下的快捷键
          -- a: hop_char1, b: hop_char2, c: hop_line, d: hop_line_start, e: hop_next_word
          a = false, b = false, c = false, d = false, e = false
      },
  })
  end,
  -- 在启动时加载
  -- event = "VeryLazy",
}

