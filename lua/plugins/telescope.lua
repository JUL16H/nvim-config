-- telescope
return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            enabled = vim.fn.executable("cmake") == 1,
            build = function()
                vim.fn.system({ "cmake", "-S.", "-Bbuild", "-DCMAKE_BUILD_TYPE=Release" })
                vim.fn.system({ "cmake", "--build", "build", "--config", "Release" })
                vim.fn.system({ "cmake", "--install", "build", "--prefix", "build" })
            end,
        },
    },
    opts = {
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
        },
    },
    keys = {
        {
            "<leader>ff",
            function()
                require("telescope.builtin").find_files()
            end,
        },
        {
            "<leader>fg",
            function()
                require("telescope.builtin").live_grep()
            end,
        },
        {
            "<leader>fb",
            function()
                require("telescope.builtin").buffers()
            end,
        },
        {
            "<leader>fh",
            function()
                require("telescope.builtin").help_tags()
            end,
        },
    },
    config = function(_, opts)
        local telescope = require("telescope")
        telescope.setup(opts)
        pcall(telescope.load_extension, "fzf")
    end,
}
