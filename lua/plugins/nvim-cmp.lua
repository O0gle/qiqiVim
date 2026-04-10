return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local kind_icons = {
            Text = "",
            Method = "󰆧",
            Function = "󰊕",
            Constructor = "",
            Field = "󰇽",
            Variable = "󰂡",
            Class = "󰠱",
            Interface = "",
            Module = "",
            Property = "󰜢",
            Unit = "",
            Value = "󰎠",
            Enum = "",
            Keyword = "󰌋",
            Snippet = "",
            Color = "󰏘",
            File = "󰈙",
            Reference = "",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "󰏿",
            Struct = "󰙅",
            Event = "",
            Operator = "󰆕",
            TypeParameter = "󰅲",
        }
        local source_labels = {
            nvim_lsp = "LSP",
            luasnip = "Snippet",
            path = "Path",
            buffer = "Buffer",
        }

        local function set_cmp_highlights()
            local ok, colors = pcall(function()
                return require("tokyonight.colors").setup()
            end)

            if not ok then
                vim.api.nvim_set_hl(0, "CmpBorder", { link = "FloatBorder" })
                vim.api.nvim_set_hl(0, "CmpDocBorder", { link = "FloatBorder" })
                vim.api.nvim_set_hl(0, "CmpPmenu", { link = "Pmenu" })
                vim.api.nvim_set_hl(0, "CmpDoc", { link = "NormalFloat" })
                vim.api.nvim_set_hl(0, "CmpSel", { link = "PmenuSel" })
                vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment" })
                vim.api.nvim_set_hl(0, "CmpItemMenu", { link = "Comment" })
                return
            end

            local highlights = {
                CmpBorder = { fg = colors.blue, bg = colors.bg_float },
                CmpDocBorder = { fg = colors.magenta, bg = colors.bg_float },
                CmpPmenu = { bg = colors.bg_float },
                CmpDoc = { bg = colors.bg_float },
                CmpSel = { bg = colors.bg_highlight, bold = true },
                CmpGhostText = { fg = colors.dark5, italic = true },
                CmpItemAbbr = { fg = colors.fg },
                CmpItemAbbrDeprecated = { fg = colors.comment, strikethrough = true },
                CmpItemAbbrMatch = { fg = colors.blue, bold = true },
                CmpItemAbbrMatchFuzzy = { fg = colors.cyan, bold = true },
                CmpItemMenu = { fg = colors.dark5, italic = true },
                CmpItemKindVariable = { fg = colors.fg },
                CmpItemKindFunction = { fg = colors.blue },
                CmpItemKindMethod = { fg = colors.blue },
                CmpItemKindKeyword = { fg = colors.magenta },
                CmpItemKindSnippet = { fg = colors.green },
                CmpItemKindClass = { fg = colors.yellow },
                CmpItemKindModule = { fg = colors.orange },
                CmpItemKindFile = { fg = colors.cyan },
                CmpItemKindFolder = { fg = colors.cyan },
                CmpItemKindProperty = { fg = colors.teal },
            }

            for group, opts in pairs(highlights) do
                vim.api.nvim_set_hl(0, group, opts)
            end
        end

        vim.opt.completeopt = { "menu", "menuone", "noselect" }

        require("luasnip.loaders.from_vscode").lazy_load()
        set_cmp_highlights()

        vim.api.nvim_create_autocmd("ColorScheme", {
            group = vim.api.nvim_create_augroup("user_cmp_highlights", { clear = true }),
            callback = set_cmp_highlights,
        })

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered({
                    border = "rounded",
                    winhighlight = "Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:CmpSel,Search:None",
                }),
                documentation = cmp.config.window.bordered({
                    border = "rounded",
                    winhighlight = "Normal:CmpDoc,FloatBorder:CmpDocBorder,Search:None",
                }),
            },
            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(entry, item)
                    local max_width = 40
                    local label = source_labels[entry.source.name] or entry.source.name

                    if vim.fn.strdisplaywidth(item.abbr) > max_width then
                        item.abbr = vim.fn.strcharpart(item.abbr, 0, max_width - 3) .. "..."
                    end

                    item.kind = string.format(" %s ", kind_icons[item.kind] or "?")
                    item.menu = string.format("  %s", label)

                    return item
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "path" },
            }, {
                { name = "buffer" },
            }),
            experimental = {
                ghost_text = true,
            },
        })
    end,
}
