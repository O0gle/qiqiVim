return {
    "zbirenbaum/copilot.lua",
    name = "copilot-nvim",
    cmd = "Copilot",
    event = "InsertEnter",
    dependencies = {
        "zbirenbaum/copilot-cmp",
    },
    config = function()
        require("copilot").setup({
            suggestion = { enabled = false },
            panel = { enabled = false },
            filetypes = {
                markdown = false,
                help = false,
            },
            copilot_node_command = vim.fn.exepath("node"),
        })

        require("copilot_cmp").setup()
    end,
}
