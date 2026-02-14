-- 自动添加</>标签
return {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" }, -- 或者仅在 html, xml 等文件类型加载
    opts = {},
    config = function(_, opts)
        require("nvim-ts-autotag").setup(opts)
    end,
}
