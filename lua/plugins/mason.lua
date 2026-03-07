-- LSP配置
return {
    "mason-org/mason.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "neovim/nvim-lspconfig",
        "mason-org/mason-lspconfig",
    },
    opts = {},
    lazy = false,
    config = function(_, opts)
        require("mason").setup(opts)
        -- require("mason-registry").refresh()

        local vue_plugin_path = vim.fn.stdpath("data")
            .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
        local enable_vue_plugin = vim.fn.isdirectory(vue_plugin_path) == 1

        local function setup(servers)
            for server, config in pairs(servers) do
                config.on_attach = function(client)
                    client.server_capabilities.documentFormattingProvider = false
                    client.server_capabilities.documentRangeFormattingProvider = false
                end

                local lsp_name = require("mason-lspconfig").get_mappings().package_to_lspconfig[server]
                if lsp_name then
                    vim.lsp.config(lsp_name, config)
                    vim.lsp.enable(lsp_name)
                end
            end
        end

        local servers = {
            ["lua-language-server"] = {
                cmd = { "/usr/bin/lua-language-server" },
                settings = { Lua = { diagnostics = { globals = { "vim" } } } },
            },
            ["clangd"] = {
                cmd = {
                    "clangd",
                    "-j=8",
                    "--background-index",
                    "--clang-tidy",
                    "--completion-style=detailed",
                    "--function-arg-placeholders=0",
                    "--compile-commands-dir=build",
                    "--all-scopes-completion",
                },
            },
            ["neocmakelsp"] = {
                cmd = { "neocmakelsp", "stdio" },
                filetypes = { "cmake" },
            },
            ["rust-analyzer"] = {
                settings = {
                    ["rust-analyzer"] = {
                        completion = { callable = { snippets = "add_parentheses" } },
                        updates = { channel = "stable" },
                    },
                },
            },
            ["bash-language-server"] = {},

            ["pyright"] = {
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "basic",
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                        },
                    },
                },
            },

            ["vue-language-server"] = {
                filetypes = { "vue" },
                init_options = {
                    vue = {
                        hybridMode = true,
                    },
                },
            },

            ["vtsls"] = {
                filetypes = {
                    "javascript",
                    "javascriptreact",
                    "typescript",
                    "typescriptreact",
                    "vue",
                },
                settings = {
                    vtsls = {
                        tsserver = {
                            globalPlugins = enable_vue_plugin
                                    and {
                                        {
                                            name = "@vue/typescript-plugin",
                                            location = vue_plugin_path,
                                            languages = { "vue" },
                                            configNamespace = "typescript",
                                            enableForWorkspaceTypeScriptVersions = true,
                                        },
                                    }
                                or {},
                        },
                    },
                },
            },

            ["omnisharp"] = {
                enable_roslyn_analyzers = true,
                organize_imports_on_format = true,
                enable_import_completion = true,
            },

            ["html-lsp"] = {
                filetypes = { "html", "templ" },
            },

            ["css-lsp"] = {},

            ["texlab"] = {
                settings = {
                    texlab = {
                        build = {
                            onSave = false,
                            forwardSearchAfter = false,
                        },
                        chktex = {
                            onOpenAndSave = true,
                            onEdit = true,
                        },
                        bibtex = {
                            formatting = {
                                citation = "crm",
                            },
                        },
                    },
                },
            },
        }

        setup(servers)

        vim.diagnostic.config({
            underline = true,
            virtual_text = true,
            update_in_insert = true,
        })
    end,
}
