-- 便捷语法操作
return {
    "nvimdev/lspsaga.nvim",
    cmd = "Lspsaga",
    opts = {
        lightbulb = {
            enable = false,
        },
    },
    keys = {
        { "<leader>lr", "<Cmd>Lspsaga rename<CR>" },
        { "<leader>lc", "<Cmd>Lspsaga code_action<CR>" },
        { "<leader>ld", "<Cmd>Lspsaga goto_definition<CR>" },
        { "<leader>lh", "<Cmd>Lspsaga hover_doc<CR>" },
        { "<leader>lR", "<Cmd>Lspsaga finder<CR>" },
        { "<leader>ln", "<Cmd>Lspsaga diagnostic_jump_next<CR>" },
        { "<leader>lp", "<Cmd>Lspsaga diagnostic_jump_prev<CR>" },
    },
}
