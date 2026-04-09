return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- 如果你没装 mini.icons 请去掉
    config = function()
        require("render-markdown").setup({})
    end,
}
