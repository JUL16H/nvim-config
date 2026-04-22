-- 显示代码结构
return {
    "hedyhli/outline.nvim",
    event = "BufReadPost *",

    keys = {
        { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle Outline" },
    },

    opts = {
        outline_window = {
            focus_on_open = false,
        },
    },

    config = function(_, opts)
        require("outline").setup(opts)

        local outline_augroup = vim.api.nvim_create_augroup("OutlineAutoOpenGroup", { clear = true })

        -- vim.api.nvim_create_autocmd("BufWinEnter", {
        --     group = outline_augroup,
        --     pattern = "*",
        --     callback = function()
        --         if vim.bo.buftype == "" and vim.fn.bufname("%") ~= "" and vim.bo.filetype ~= "Outline" then
        --             pcall(vim.cmd.OutlineOpen)
        --         end
        --     end,
        -- })

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
