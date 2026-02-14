-- 语法树解析及文本对象增强
return {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    main = "nvim-treesitter.configs",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects", -- 添加此依赖
    },
    opts = {
        ensure_installed = {
            'c', 'cpp', 'rust', 'python', 'lua', 'vim', 'vimdoc',
            'javascript', 'typescript', 'java', 'html', 'css',
            'query', 'markdown', 'markdown_inline', 'c_sharp',
            'bash', 'json', 'cmake', 'csv', 'cuda', 'git_config',
            'gitattributes', 'gitcommit', 'gitignore', 'http',
            'json5', 'jsonc', 'sql', 'vue'
        },
        highlight = { enable = true },

        -- 新增 textobjects 配置
        textobjects = {
            select = {
                enable = true,
                lookahead = true, -- 自动跳转到下一个文本对象
                keymaps = {
                    -- 你可以自定义这些触发键
                    ["af"] = "@function.outer", -- 选中整个函数 (Around Function)
                    ["if"] = "@function.inner", -- 选中函数体内部 (Inside Function)
                    ["ac"] = "@class.outer",    -- 选中整个类
                    ["ic"] = "@class.inner",    -- 选中类内部
                    ["ai"] = "@conditional.outer", -- 选中 if/else 整个块
                    ["ii"] = "@conditional.inner", -- 选中 if/else 内部
                    ["al"] = "@loop.outer",       -- 选中循环块
                    ["il"] = "@loop.inner",       -- 选中循环内部
                },
            },
            -- 进阶：快速跳转到上一个/下一个函数
            move = {
                enable = true,
                set_jumps = true, -- 是否在跳转列表中记录 (Ctrl-o/i)
                goto_next_start = {
                    ["]m"] = "@function.outer",
                    ["]]"] = "@class.outer",
                },
                goto_next_end = {
                    ["]M"] = "@function.outer",
                    ["]["] = "@class.outer",
                },
                goto_previous_start = {
                    ["[m"] = "@function.outer",
                    ["[["] = "@class.outer",
                },
                goto_previous_end = {
                    ["[M"] = "@function.outer",
                    ["[]"] = "@class.outer",
                },
            },
        },
    }
}
