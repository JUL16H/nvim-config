-- 显示颜色
return {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("colorizer").setup({
            "*",

            css = { css = true, names = true },
            scss = { css = true, names = true },
            html = { css = true, names = true },
        }, {
            RGB = true,
            RRGGBB = true,
            names = false,
            RRGGBBAA = true,
            rgb_fn = true,
            hsl_fn = true,
            css = false,
            css_fn = true,
            model = "background",
        })
    end,
}
