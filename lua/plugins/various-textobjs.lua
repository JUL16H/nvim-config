-- 快速范围选择
return {
    "chrisgrieser/nvim-various-textobjs",
    event = "VeryLazy",
    opts = {
        keymaps = { useDefaults = false },
        -- 你可以在这里禁用某些不需要的通知
        notify = { whenObjectNotFound = true },
    },
    keys = {
        -----------------------------------------------------------------------
        -- 1. 核心保留 (你原本的配置)
        -----------------------------------------------------------------------
        {
            "ie",
            function()
                require("various-textobjs").entireBuffer()
            end,
            mode = { "o", "x" },
            desc = "Entire Buffer (整个文件)",
        },

        -----------------------------------------------------------------------
        -- 3. 智能单词 (CamelCase/snake_case)
        -----------------------------------------------------------------------
        -- 比如在 "myVariableName" 中，
        -- iw 会选中整个单词
        -- is 会选中 "Variable" (Subword)
        {
            "is",
            function()
                require("various-textobjs").subword("inner")
            end,
            mode = { "o", "x" },
            desc = "Inner Subword (驼峰/下划线分词)",
        },

        -----------------------------------------------------------------------
        -- 4. 键值对 (Key / Value)
        -----------------------------------------------------------------------
        -- 比如 config = { key = "value" }
        -- ik 选中 key
        -- iv 选中 "value"
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

        -----------------------------------------------------------------------
        -- 5. 实用工具 (URL / 数字 / 诊断信息)
        -----------------------------------------------------------------------
        -- 快速选中光标下的 URL
        {
            "iu",
            function()
                require("various-textobjs").url()
            end,
            mode = { "o", "x" },
            desc = "Inner URL (链接)",
        },
        -- 快速选中光标下的数字 (支持 0xFF, 12.34 等)
        {
            "in",
            function()
                require("various-textobjs").number()
            end,
            mode = { "o", "x" },
            desc = "Inner Number (数字)",
        },
        -- 快速选中 LSP 报错/警告区域 (非常有用！)
        {
            "i!",
            function()
                require("various-textobjs").diagnostic()
            end,
            mode = { "o", "x" },
            desc = "Inner Diagnostic (诊断报错范围)",
        },

        -----------------------------------------------------------------------
        -- 6. 可见区域 (Visible)
        -----------------------------------------------------------------------
        -- 选中当前屏幕看到的所有内容
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
