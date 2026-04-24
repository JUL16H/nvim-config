return {
    "saghen/blink.cmp",
    version = "1.*",
    event = "InsertEnter",

    dependencies = {
        "rafamadriz/friendly-snippets",
    },

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = "super-tab",
        },

        appearance = {
            nerd_font_variant = "mono",
            use_nvim_cmp_as_default = false,
        },

        completion = {
            accept = {
                auto_brackets = {
                    enabled = true,
                },
            },

            menu = {
                border = "rounded",
                draw = {
                    -- 不要让 blink.cmp 用 treesitter 给补全项上色
                    treesitter = {},
                },
            },

            documentation = {
                -- 先关掉自动文档浮窗，避免继续触发 treesitter 报错
                auto_show = false,
                auto_show_delay_ms = 200,
                treesitter_highlighting = false,
                window = {
                    border = "rounded",
                },
            },

            ghost_text = {
                enabled = false,
            },
        },

        signature = {
            enabled = false,
            window = {
                border = "rounded",
            },
        },

        sources = {
            default = {
                "lsp",
                "path",
                "snippets",
            },
        },
    },

    opts_extend = {
        "sources.default",
    },
}
