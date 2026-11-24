return {
    { "xzbdmw/colorful-menu.nvim", lazy = false, opts = {} },
    {
        "rafamadriz/friendly-snippets",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
    { "L3MON4D3/LuaSnip",          lazy = false, opts = {} },
    {
        "saghen/blink.cmp",
        version = "1.*",
        lazy = false,
        config = function()
            local blink = require("blink.cmp")
            blink.setup({
                keymap = {
                    preset = "none",
                    ["<CR>"] = { "accept", "fallback" },
                    ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
                    ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
                },
                appearance = { nerd_font_variant = "normal" },
                sources = {
                    default = { "lazydev", "lsp", "path", "snippets", "buffer" },
                    providers = {
                        lazydev = {
                            name = "LazyDev",
                            module = "lazydev.integrations.blink",
                            score_offset = 100,
                        },
                    },
                },
                snippets = { preset = "luasnip" },
                fuzzy = {
                    implementation = "prefer_rust_with_warning",
                },
                signature = { enabled = true },
                completion = {
                    documentation = {
                        auto_show = false,
                    },
                    menu = {
                        auto_show_delay_ms = 0,
                        draw = {
                            columns = { { "kind_icon" }, { "label", gap = 1 } },
                            components = {
                                label = {
                                    text = function(ctx)
                                        return require("colorful-menu").blink_components_text(ctx)
                                    end,
                                    highlight = function(ctx)
                                        return require("colorful-menu").blink_components_highlight(ctx)
                                    end,
                                },
                            },
                        },
                    },
                },
            })
        end,
    } }
