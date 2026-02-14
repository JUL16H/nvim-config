-- 去除无用空格和尾部空行
return {
    "cappyzawa/trim.nvim",
    event = "BufWritePre",
    config = function()
        require("trim").setup({
            ft_blocklist = { "markdown" },
        })
    end,
}
