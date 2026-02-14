-- tokyonight主题
return {
    "folke/tokyonight.nvim",
    opts = {
        style = "moon",
        on_highlights = function(hl, c)
            hl.Comment = { fg = "#c0c0c0", italic = true }

            hl.MatchParen = {
                bg = c.orange,
                fg = c.black,
                bold = false,
            }
            hl.DiagnosticUnnecessary = {
                fg = c.comment,
            }

            local line_nr_color = c.comment
            hl.LineNr = { fg = line_nr_color }
            hl.LineNrAbove = { fg = line_nr_color }
            hl.LineNrBelow = { fg = line_nr_color }

            hl.MsgArea = { bg = "NONE" }
            hl.EndOfBuffer = { bg = "NONE" }
        end,
    },
    config = function(_, opts)
        require("tokyonight").setup(opts)
        vim.cmd("colorscheme tokyonight")
    end,
}
