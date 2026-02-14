-- 快速跳转/选择
return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        jump = {
            history = true,
            autojump = false,
        },
        label = {
            style = "overlay"
        },

    },
    keys = {
        {
            "s",
            mode = {'n', 'x', 'o'},
            function() require("flash").jump() end,
        },
        {
            "S",
            mode = {'n', 'x', 'o'},
            function() require("flash").treesitter() end,
        },
        {
            'r',
            mode = "o",
            function() require("flash").remote() end,
        },
        {
            "<c-s>",
            mode = {'c'},
            function() require("flash").toggle() end,
        }
    }
}
