-- 格式化工具
return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "ConformInfo" },
    opts = {
        formatters_by_ft = {
            c = { "clang-format" },
            cpp = { "clang-format" },
            lua = { "stylua" },
            rust = { "rustfmt" },
            cs = { "csharpier" },
            python = { "isort", "black" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            html = { "prettier" },
            css = { "prettier" },
            vue = { "prettier" },
            scss = { "prettier" },
            json = { "prettier" },
            xml = { "prettier_xml" },
            svg = { "prettier_xml" },
        },
        formatters = {
            ["clang-format"] = {
                prepend_args = {
                    "-style={BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4, UseTab: Never, AlwaysBreakTemplateDeclarations: Yes, AccessModifierOffset: -4, ColumnLimit: 100}",
                },
            },
            stylua = {
                prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" },
            },
            rustfmt = {
                prepend_args = { "--config", "tab_spaces=4" },
            },

            -- === Prettier 配置 (强制 4 空格) ===
            prettier = {
                -- 保持和你 C++/Lua 一致的 4 空格缩进习惯
                prepend_args = {
                    "--tab-width",
                    "4",
                    "--use-tabs",
                    "false",
                    "--print-width",
                    "100",
                    "--vue-indent-script-and-style",
                    "true",
                },
            },

            -- === Python Black 配置 ===
            black = {
                -- Black 默认行宽是 88，如果你喜欢 100 可以改这里
                prepend_args = { "--line-length", "100" },
            },

            -- === Python Isort 配置 ===
            isort = {
                prepend_args = { "--profile", "black", "--line-length", "100" },
            },

            xmlformat = {
                -- 强制 4 空格缩进，与你其他语言保持一致
                prepend_args = { "--indent", "4" },
            },

            prettier_xml = {
                command = "/usr/bin/prettier",
                args = {
                    "--parser",
                    "xml",
                    "--plugin",
                    "/usr/lib/node_modules/@prettier/plugin-xml/src/plugin.js",

                    "--stdin-filepath",
                    "$FILENAME",
                    "--single-attribute-per-line",
                    "true", -- 还原你喜欢的多行属性风格
                    "--print-width",
                    "100",
                    "--tab-width",
                    "4",
                    "--xml-whitespace-sensitivity",
                    "ignore",
                },
            },
        },
    },
    config = function(_, opts)
        local conform = require("conform")
        conform.setup(opts)

        vim.keymap.set({ "n", "v" }, "<leader>lf", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000, -- 稍微增加超时时间，防止冷启动时格式化失败
            })
        end)
    end,
}
