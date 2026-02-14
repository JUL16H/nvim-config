-- lualine
return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
    opts = {
        options = {
            theme = "auto",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {
                statusline = { "trouble", "Outline" },
            },
            refresh = {
                statusline = 100,
            },
        },
        extensions = { "nvim-tree" },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = {
                "filename",
                {
                    function()
                        local reg = vim.fn.reg_recording()
                        if reg == "" then
                            return ""
                        end -- 不在录制时返回空
                        return " Rec @" .. reg -- 录制时显示 "Rec @q"
                    end,
                    color = { fg = "#ff9e64", gui = "bold" }, -- 设置醒目的颜色(橙色)
                },
            },

            lualine_x = {
                "filesize",
                "encoding",
                "filetype",
            },

            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
    },
}
