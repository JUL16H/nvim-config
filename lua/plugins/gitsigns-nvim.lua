-- git信息
return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        signs = {
            add = { text = "▎" },
            change = { text = "▎" },
            delete = { text = "" },
            topdelete = { text = "" },
            changedelete = { text = "▎" },
            untracked = { text = "▎" },
        },
        current_line_blame = false,
        current_line_blame_opts = {
            delay = 500,
            virt_text_pos = "eol",
        },

        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, desc)
                vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
            end

            -- 导航 (跳转到下一个/上一个修改)
            map("n", "]c", function()
                if vim.wo.diff then return "]c" end
                vim.schedule(function() gs.next_hunk() end)
                return "<Ignore>"
            end, "Next Hunk (下一处修改)")

            map("n", "[c", function()
                if vim.wo.diff then return "[c" end
                vim.schedule(function() gs.prev_hunk() end)
                return "<Ignore>"
            end, "Prev Hunk (上一处修改)")

            -- 常用操作
            map("n", "<leader>hs", gs.stage_hunk, "Stage Hunk (暂存当前修改块)")
            map("n", "<leader>hr", gs.reset_hunk, "Reset Hunk (重置当前修改块)")
            map("n", "<leader>hS", gs.stage_buffer, "Stage Buffer (暂存整个文件)")
            map("n", "<leader>hu", gs.undo_stage_hunk, "Undo Stage Hunk (撤销暂存)")
            map("n", "<leader>hp", gs.preview_hunk, "Preview Hunk (预览修改内容)")
            map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame Line (查看详细Blame)")
            map("n", "<leader>hd", gs.diffthis, "Diff This (与Git版本对比)")
        end,
    },
}
