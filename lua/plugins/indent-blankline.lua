return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl", -- 最新版本使用 "ibl" 作为主模块
  config = function()
      local colors = {
          '#616161',
          '#6d85a1',
          '#8d6e53',
          '#43a047',
          '#ab47bc',
          '#f57c00',
      }


      for i, color in ipairs(colors) do

          vim.api.nvim_set_hl(0, 'IndentBlankline' .. i, { fg = color, nocombine = true})
      end


      vim.api.nvim_set_hl(0, 'IndentBlanklineContext', { fg = '#90a4ae', nocombine = true})



      require("ibl").setup({

          indent = {
              char = '┊',
              highlight = { -- 使用上面定义的颜色组
                  "IndentBlankline1",
                  "IndentBlankline2",
                  "IndentBlankline3",
                  "IndentBlankline4",
                  "IndentBlankline5",
                  "IndentBlankline6",
              },
          },
          -- 启用括号连接线
          scope = {
              enabled = true, -- 开启范围线（括号连接线）
              show_start = true, -- 显示起始括号的线
              show_end = true,   -- 显示结束括号的线
              injected_languages = false, -- 不单独处理注入的语言
          },
          exclude = {
              filetypes = {
                  'dashboard',
                  'packer',
                  'NvimTree',
                  'alpha',
                  'TelescopePrompt',
                  'help',
                  'mason',
              },
          },
      })
  end
}