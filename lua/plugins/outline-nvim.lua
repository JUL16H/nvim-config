-- 显示代码结构
return {
    "hedyhli/outline.nvim",
    -- **加载事件**
    event = "BufReadPost *",

    -- **快捷键**
    keys = {
        { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle Outline" },
    },

    opts = {
        -- 【关键修改】在这里配置窗口行为
        outline_window = {
            -- 打开时是否聚焦到大纲窗口：设置为 false 则光标保留在代码窗口
            focus_on_open = false,
        },
    },

    config = function(_, opts)
        require("outline").setup(opts)

        -- 创建一个共用的 Augroup
        local outline_augroup = vim.api.nvim_create_augroup("OutlineAutoOpenGroup", { clear = true })

        -- 1. 自动打开逻辑
        vim.api.nvim_create_autocmd("BufWinEnter", {
            group = outline_augroup,
            pattern = "*",
            callback = function()
                if vim.bo.buftype == "" and vim.fn.bufname("%") ~= "" and vim.bo.filetype ~= "Outline" then
                    pcall(vim.cmd.OutlineOpen)
                end
            end,
        })

        -- 2. LSP 准备好后的自动刷新逻辑
        vim.api.nvim_create_autocmd("LspAttach", {
            group = outline_augroup,
            callback = function(args)
                if args.buf == vim.api.nvim_get_current_buf() then
                    if vim.bo.filetype == "Outline" then
                        return
                    end

                    vim.schedule(function()
                        if require("outline").is_open() then
                            vim.cmd("OutlineRefresh")
                        end
                    end)
                end
            end,
        })
    end,
}
