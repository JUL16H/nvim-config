return {
    "lervag/vimtex",
    lazy = false,
    init = function()
        vim.g.vimtex_view_method = "zathura"

        vim.g.vimtex_syntax_conceal = { math_bounds = 0 }

        vim.g.vimtex_compiler_method = "latexmk"
    end,
}
