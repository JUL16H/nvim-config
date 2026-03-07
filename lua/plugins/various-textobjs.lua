-- 快速范围选择
return {
    "chrisgrieser/nvim-various-textobjs",
    event = "VeryLazy",
    opts = {
        keymaps = { useDefaults = false },
        notify = { whenObjectNotFound = true },
    },
    keys = {
        {
            "ie",
            function()
                require("various-textobjs").entireBuffer()
            end,
            mode = { "o", "x" },
            desc = "Entire Buffer (整个文件)",
        },

        {
            "is",
            function()
                require("various-textobjs").subword("inner")
            end,
            mode = { "o", "x" },
            desc = "Inner Subword (驼峰/下划线分词)",
        },

        {
            "ik",
            function()
                require("various-textobjs").key("inner")
            end,
            mode = { "o", "x" },
            desc = "Inner Key (键)",
        },
        {
            "iv",
            function()
                require("various-textobjs").value("inner")
            end,
            mode = { "o", "x" },
            desc = "Inner Value (值)",
        },

        {
            "iu",
            function()
                require("various-textobjs").url()
            end,
            mode = { "o", "x" },
            desc = "Inner URL (链接)",
        },
        {
            "in",
            function()
                require("various-textobjs").number()
            end,
            mode = { "o", "x" },
            desc = "Inner Number (数字)",
        },
        {
            "i!",
            function()
                require("various-textobjs").diagnostic()
            end,
            mode = { "o", "x" },
            desc = "Inner Diagnostic (诊断报错范围)",
        },

        {
            "iV",
            function()
                require("various-textobjs").visibleInWindow()
            end,
            mode = { "o", "x" },
            desc = "Visible Area (当前可视区域)",
        },
    },
}
