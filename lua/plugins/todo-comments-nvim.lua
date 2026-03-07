-- 高亮/快速跳转TODO标记
return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        signs = true,
    },
    keys = {
        { "]t", function() require("todo-comments").jump_next() end},
        { "[t", function() require("todo-comments").jump_prev() end},
        { "<leader>st", "<cmd>TodoTelescope<cr>"},
    },
}
