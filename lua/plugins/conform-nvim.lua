local platform = require("core.platform")

local function find_xml_plugin()
    local found = vim.fs.find(
        { "node_modules/@prettier/plugin-xml/src/plugin.js" },
        { upward = true, path = vim.fn.getcwd() }
    )
    return found[1]
end

return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>lf",
            function()
                require("conform").format({
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 1000,
                })
            end,
            mode = { "n", "v" },
            desc = "Format file or range",
        },
    },
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
            prettier = {
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
            black = {
                prepend_args = { "--line-length", "100" },
            },
            isort = {
                prepend_args = { "--profile", "black", "--line-length", "100" },
            },
            prettier_xml = {
                command = platform.first_executable({ "prettier", "prettier.cmd" }) or "prettier",
                args = function(_, ctx)
                    local args = {
                        "--parser",
                        "xml",
                        "--stdin-filepath",
                        ctx.filename,
                        "--single-attribute-per-line",
                        "true",
                        "--print-width",
                        "100",
                        "--tab-width",
                        "4",
                        "--xml-whitespace-sensitivity",
                        "ignore",
                    }

                    local plugin = find_xml_plugin()
                    if plugin then
                        table.insert(args, 3, "--plugin")
                        table.insert(args, 4, plugin)
                    end

                    return args
                end,
            },
        },
    },
}
