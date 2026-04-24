return {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        file_types = { "markdown" },

        ignore = function(buf)
            return vim.bo[buf].buftype ~= ""
        end,
    },
}
