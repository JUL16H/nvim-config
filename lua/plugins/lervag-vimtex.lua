return {
    "lervag/vimtex",
    lazy = false, -- 建议不要懒加载，以免文件类型检测失效
    init = function()
        -- 指定 PDF 阅读器为 Zathura
        vim.g.vimtex_view_method = "zathura"

        -- 这是一个比较现代的设置，防止 VimTeX 自动修改你的 conceallevel
        -- 但如果你喜欢数学公式在编辑器里被渲染成符号（如 \lambda 显示为 λ），可以删掉这行
        vim.g.vimtex_syntax_conceal = { math_bounds = 0 }

        -- 设置主编译引擎为 latexmk (默认即是，可省略)
        vim.g.vimtex_compiler_method = "latexmk"
    end,
}
