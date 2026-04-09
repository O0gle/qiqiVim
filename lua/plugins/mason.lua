return {
  {
      "williamboman/mason.nvim",
      build = ":MasonUpdate", -- 更新 Mason 自身
      opts = {
          ui = { -- UI 配置归属 Mason，这里才生效
              border = "rounded",
              icons = {
                  package_installed = "✓",
                  package_pending = "➜",
                  package_uninstalled = "✗"
              }
          },
      },
  }
}