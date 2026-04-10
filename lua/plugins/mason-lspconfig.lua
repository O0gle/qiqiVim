return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local group = vim.api.nvim_create_augroup("user_lsp_keymaps", { clear = true })
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

        if ok then
            capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
        end

        vim.lsp.config("*", {
            capabilities = capabilities,
        })

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
