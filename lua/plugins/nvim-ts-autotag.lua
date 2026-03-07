-- 自动添加</>标签
return {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
    config = function(_, opts)
        require("nvim-ts-autotag").setup(opts)
    end,
}
