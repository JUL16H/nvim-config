local platform = require("core.platform")

return {
    "lervag/vimtex",
    ft = { "tex", "plaintex", "bib" },
    init = function()
        vim.g.vimtex_syntax_conceal = { math_bounds = 0 }
        vim.g.vimtex_compiler_method = "latexmk"

        if platform.is_win then
            vim.g.vimtex_view_method = "general"
            vim.g.vimtex_view_general_viewer = "SumatraPDF"
            vim.g.vimtex_view_general_options = [[-reuse-instance -forward-search @tex @line @pdf]]
        elseif platform.is_linux then
            vim.g.vimtex_view_method = "zathura"
        end
    end,
}
