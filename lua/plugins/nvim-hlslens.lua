-- 搜索显示快速跳转提示
return {
    "kevinhwang91/nvim-hlslens",
    event = "VeryLazy",
    opts = {
        calm_down = true,
    },
    config = function(_, opts)
        require("hlslens").setup(opts)
    end
}
