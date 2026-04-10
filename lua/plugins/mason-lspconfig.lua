return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
    },
    config = function()
        local group = vim.api.nvim_create_augroup("user_lsp_keymaps", { clear = true })

        vim.api.nvim_create_autocmd("LspAttach", {
            group = group,
            callback = function(event)
                local opts = { noremap = true, silent = true, buffer = event.buf }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            end,
        })

        require("mason-lspconfig").setup({
            ensure_installed = { "kotlin_language_server", "ts_ls" },
            automatic_enable = true,
        })
    end,
}
