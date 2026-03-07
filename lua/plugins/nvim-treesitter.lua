-- 语法树解析及文本对象增强
return {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    main = "nvim-treesitter.configs",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
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

        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {

                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                    ["ai"] = "@conditional.outer",
                    ["ii"] = "@conditional.inner",
                    ["al"] = "@loop.outer",
                    ["il"] = "@loop.inner",
                },
            },

            move = {
                enable = true,
                set_jumps = true,
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
