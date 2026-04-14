return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
        check_ts = true, -- 启用 treesitter 检查，防止在字符串或注释里瞎补全
        disable_filetype = { "TelescopePrompt", "vim" },
        fast_wrap = {}, -- 开启快速包裹功能
    },
    config = function(_, opts)
        require("nvim-autopairs").setup(opts)
    end,
}
