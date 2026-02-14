-- 显示颜色
return {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("colorizer").setup(
            -- 【参数 1】：配置生效的文件类型及特定覆盖
            {
                "*", -- 首先对所有文件启用插件

                -- 针对 CSS, SCSS, HTML 单独开启 names (显示 Yellow 等)
                css = { css = true, names = true },
                scss = { css = true, names = true },
                html = { css = true, names = true },
                -- 如果还有其他需要“全显示”的文件类型，按上面的格式加在这里
            },

            -- 【参数 2】：全局默认配置（适用于上面没单独设置的文件）
            {
                RGB = true,
                RRGGBB = true,
                names = false, -- 【全局默认】：关闭单词高亮 (Yellow, Blue 不显示)
                RRGGBBAA = true,
                rgb_fn = true,
                hsl_fn = true,
                css = false, -- 默认关闭 css 特性以防干扰
                css_fn = true,
                model = "background",
            }
        )
    end,
}
