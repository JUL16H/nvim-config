return {
    "saghen/blink.cmp",
    event = "InsertEnter",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },

    version = "v0.*",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = { preset = "super-tab" },

        appearance = {
            nerd_font_variant = "mono",
            use_nvim_cmp_as_default = false,
        },

        completion = {
            accept = { auto_brackets = { enabled = true } },

            menu = {
                border = "rounded",
                draw = {
                    treesitter = { "lsp" },
                },
            },

            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
                window = { border = "rounded" },
            },
        },

        signature = {
            enabled = true,
            window = { border = "rounded" },
        },

        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
    },
    opts_extend = { "sources.default" },
}
