return {
    "saghen/blink.cmp",
    lazy = false, -- 自动补全不需要懒加载，或者随触发事件加载
    dependencies = {
        -- 只需保留这一个 snippet 集合，blink 内置了 snippet 解析引擎
        "rafamadriz/friendly-snippets",
    },

    -- 使用预编译的二进制文件（极大提升加载和运行速度）
    version = "v0.*",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- 键位预设。
        -- 'default' 行为类似 VSCode；
        -- 'super-tab' 行为接近你之前设置的 Tab 补全；
        -- 'enter' 则是回车确认。
        keymap = { preset = "super-tab" },

        appearance = {
            -- 既然你使用的是 JetBrainsMonoNL Nerd Font，设为 mono 可以让图标对齐得更好
            nerd_font_variant = "mono",
            use_nvim_cmp_as_default = false,
        },

        completion = {
            -- 自动在函数名后补全括号
            accept = { auto_brackets = { enabled = true } },

            menu = {
                border = "rounded",
                draw = {
                    -- 让补全菜单使用 Treesitter 渲染高亮（比如函数的返回类型和参数会带颜色）
                    treesitter = { "lsp" },
                },
            },

            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
                window = { border = "rounded" },
            },
        },

        -- 签名帮助（函数参数提示），开启后可以替代 lsp_signature.nvim
        signature = {
            enabled = true,
            window = { border = "rounded" },
        },

        sources = {
            -- 核心补全源，不需要像 cmp 那样额外下载插件
            default = { "lsp", "path", "snippets", "buffer" },
        },
    },
    opts_extend = { "sources.default" },
}
