-- 缩进范围显示
return {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    main = 'ibl',
    opts = {
        scope = {
            enabled = true,      -- 开启作用域高亮（左侧竖线）
            show_start = false,  -- 【关键】设置为 false，去掉代码块顶部的横线
            show_end = false,    -- 设置为 false，去掉代码块底部的横线（如果有的话）
        },
    },
}
