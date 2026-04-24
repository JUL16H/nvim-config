local parsers = {
    "bash",
    "c",
    "cpp",
    "rust",
    "python",
    "lua",
    "vim",
    "vimdoc",
    "javascript",
    "typescript",
    "java",
    "html",
    "css",
    "query",
    "markdown",
    "markdown_inline",
    "c_sharp",
    "json",
    "json5",
    "jsonc",
    "cmake",
    "csv",
    "cuda",
    "git_config",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "http",
    "sql",
    "vue",
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",

        config = function()
            require("nvim-treesitter").setup({
                install_dir = vim.fn.stdpath("data") .. "/site",
            })

            require("nvim-treesitter").install(parsers)

            local group = vim.api.nvim_create_augroup("UserTreesitterStart", {
                clear = true,
            })

            vim.api.nvim_create_autocmd("FileType", {
                group = group,
                callback = function(args)
                    -- 关键：不要给 LSP hover / completion doc 这种临时 nofile buffer 开 treesitter
                    -- 你现在爆红就是这种 markdown 临时浮窗触发的
                    if vim.bo[args.buf].buftype ~= "" then
                        return
                    end

                    local ft = vim.bo[args.buf].filetype
                    local lang = vim.treesitter.language.get_lang(ft)

                    if not lang then
                        return
                    end

                    pcall(vim.treesitter.start, args.buf, lang)
                end,
            })
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        dependencies = { "nvim-treesitter/nvim-treesitter" },

        config = function()
            require("nvim-treesitter-textobjects").setup({
                select = {
                    lookahead = true,
                },
                move = {
                    set_jumps = true,
                },
            })

            local select = require("nvim-treesitter-textobjects.select")
            local move = require("nvim-treesitter-textobjects.move")

            vim.keymap.set({ "x", "o" }, "af", function()
                select.select_textobject("@function.outer", "textobjects")
            end)

            vim.keymap.set({ "x", "o" }, "if", function()
                select.select_textobject("@function.inner", "textobjects")
            end)

            vim.keymap.set({ "x", "o" }, "ac", function()
                select.select_textobject("@class.outer", "textobjects")
            end)

            vim.keymap.set({ "x", "o" }, "ic", function()
                select.select_textobject("@class.inner", "textobjects")
            end)

            vim.keymap.set({ "x", "o" }, "ai", function()
                select.select_textobject("@conditional.outer", "textobjects")
            end)

            vim.keymap.set({ "x", "o" }, "ii", function()
                select.select_textobject("@conditional.inner", "textobjects")
            end)

            vim.keymap.set({ "x", "o" }, "al", function()
                select.select_textobject("@loop.outer", "textobjects")
            end)

            vim.keymap.set({ "x", "o" }, "il", function()
                select.select_textobject("@loop.inner", "textobjects")
            end)

            vim.keymap.set({ "n", "x", "o" }, "]m", function()
                move.goto_next_start("@function.outer", "textobjects")
            end)

            vim.keymap.set({ "n", "x", "o" }, "]]", function()
                move.goto_next_start("@class.outer", "textobjects")
            end)

            vim.keymap.set({ "n", "x", "o" }, "]M", function()
                move.goto_next_end("@function.outer", "textobjects")
            end)

            vim.keymap.set({ "n", "x", "o" }, "][", function()
                move.goto_next_end("@class.outer", "textobjects")
            end)

            vim.keymap.set({ "n", "x", "o" }, "[m", function()
                move.goto_previous_start("@function.outer", "textobjects")
            end)

            vim.keymap.set({ "n", "x", "o" }, "[[", function()
                move.goto_previous_start("@class.outer", "textobjects")
            end)

            vim.keymap.set({ "n", "x", "o" }, "[M", function()
                move.goto_previous_end("@function.outer", "textobjects")
            end)

            vim.keymap.set({ "n", "x", "o" }, "[]", function()
                move.goto_previous_end("@class.outer", "textobjects")
            end)
        end,
    },
}
