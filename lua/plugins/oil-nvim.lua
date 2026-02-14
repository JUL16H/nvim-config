return {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            default_file_explorer = false,
            skip_confirm_for_simple_edits = true,
            delete_to_trash = true,
            columns = { "icon" },
            constrain_cursor = "name",

            view_options = {
                show_hidden = true,
            },
            float = {
                padding = 2,
                max_width = 90,
                max_height = 0,
                border = "rounded",
                win_options = {
                    winblend = 0,
                },
            },
            preview = {
                -- 你的预览配置保持不变...
                max_width = 0.9,
                min_width = { 40, 0.4 },
                border = "rounded",
                win_options = {
                    winblend = 0,
                },
            },
            keymaps = {
                ["g?"] = "actions.show_help",
                ["<S-l>"] = "actions.select",
                ["<S-h>"] = "actions.parent",
                ["<CR>"] = "actions.select",
                ["K"] = "actions.preview",
                ["<C-p>"] = false,
                ["q"] = "actions.close",
                ["<Esc>"] = "actions.close",
                ["<leader>e"] = "actions.close",
                ["."] = "actions.toggle_hidden",
                ["`"] = "actions.cd",
                ["~"] = "actions.tcd",
                ["gs"] = "actions.change_sort",
                ["gx"] = "actions.open_external",
                ["vs"] = "actions.select_vsplit",
                ["sp"] = "actions.select_split",
            },
            use_default_keymaps = false,
        })

        vim.keymap.set("n", "<leader>e", "<CMD>Oil --float<CR>", { desc = "File Explorer" })
    end,
}
