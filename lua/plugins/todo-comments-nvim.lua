-- 高亮/快速跳转TODO标记
return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    opts = {
    -- 你可以在这里自定义颜色或图标，但默认的配合 tokyonight 已经很完美了
        signs = true,
    },
    keys = {
    -- 增加一些快捷键来搜索 TODO
        { "]t", function() require("todo-comments").jump_next() end},
        { "[t", function() require("todo-comments").jump_prev() end},
    -- 如果你装了 Telescope，可以使用 :TodoTelescope
        { "<leader>st", "<cmd>TodoTelescope<cr>"},
    },
}
