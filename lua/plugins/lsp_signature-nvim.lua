-- 显示函数描述
return {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
        bind = true,
        floating_window = true,
        check_completion_visible = true,
        handler_opts = {
            border = "rounded",
        },
        hint_enable = false,
        zindex = 50,
        timer_interval = 200,
    },
    config = function(_, opts)
        require("lsp_signature").setup(opts)
    end,
}
