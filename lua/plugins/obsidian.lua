return {
    {
        "obsidian-nvim/obsidian.nvim",
        version = "*",
        ft = "markdown",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {
            legacy_commands = false,

            workspaces = {
                {
                    name = "personal",
                    path = "~/Obsidian",
                },
            },

            notes_subdir = "notes",
            new_notes_location = "notes_subdir",

            link = {
                style = "wiki",
            },

            frontmatter = {
                enabled = false,
            },

            daily_notes = {
                folder = "daily",
                date_format = "%Y-%m-%d",
                alias_format = "%Y-%m-%d",
                default_tags = { "daily-notes" },
                template = nil,
            },

            templates = {
                folder = "templates",
                date_format = "%Y-%m-%d",
                time_format = "%H:%M",
            },

            attachments = {
                folder = "assets/imgs",
            },
        },

        keys = {
            { "<leader>on", "<cmd>Obsidian new<cr>", desc = "Obsidian New Note" },
            { "<leader>oq", "<cmd>Obsidian quick_switch<cr>", desc = "Obsidian Quick Switch" },
            { "<leader>of", "<cmd>Obsidian follow_link<cr>", desc = "Obsidian Follow Link" },
            { "<leader>ob", "<cmd>Obsidian backlinks<cr>", desc = "Obsidian Backlinks" },
            { "<leader>ot", "<cmd>Obsidian tags<cr>", desc = "Obsidian Tags" },
            { "<leader>od", "<cmd>Obsidian today<cr>", desc = "Obsidian Today" },
            { "<leader>oy", "<cmd>Obsidian yesterday<cr>", desc = "Obsidian Yesterday" },
            { "<leader>om", "<cmd>Obsidian tomorrow<cr>", desc = "Obsidian Tomorrow" },
            { "<leader>os", "<cmd>Obsidian search<cr>", desc = "Obsidian Search" },
            { "<leader>op", "<cmd>Obsidian paste_img<cr>", desc = "Obsidian Paste Image" },
            { "<leader>or", "<cmd>Obsidian rename<cr>", desc = "Obsidian Rename Note" },
            { "<leader>ol", "<cmd>Obsidian links<cr>", desc = "Obsidian Links" },

            {
                "gf",
                function()
                    return require("obsidian").util.gf_passthrough()
                end,
                expr = true,
                desc = "Obsidian GF",
            },
            {
                "<CR>",
                function()
                    return require("obsidian").util.smart_action()
                end,
                expr = true,
                desc = "Obsidian Smart Action",
            },
        },
    },
}
