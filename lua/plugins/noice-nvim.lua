return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        -- 默认情况下 noice 就会把 cmdline 放在中间 (cmdline_popup)
        -- 如果你想强制指定或自定义，可以在这里配置
        cmdline = {
            enabled = true, -- 启用 cmdline 美化
            view = "cmdline_popup", -- 视图模式：cmdline_popup (中间) 或 cmdline (底部)
        },
        -- 推荐开启 lsp 文档边框渲染
        lsp = {
            signature = {
                enabled = false,
            },
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
        },
        -- 预设配置，根据你的需求开启
        presets = {
            bottom_search = true, -- 搜索栏(/)依然在底部，命令栏(:)在中间 (个人推荐，防遮挡)
            command_palette = true, -- 将 cmdline 和 popupmenu 结合
            long_message_to_split = true, -- 长消息发送到 split
            inc_rename = false, -- 启用增量重命名输入框 (需要 inc-rename.nvim)
            lsp_doc_border = false, -- 为 hover 文档添加边框
        },
    },
    dependencies = {
        -- 必须依赖
        "MunifTanjim/nui.nvim",
        -- 可选依赖：用于显示漂亮的通知弹窗
        -- "rcarriga/nvim-notify",
    },
}
