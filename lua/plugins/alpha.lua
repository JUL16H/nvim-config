return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    priority = 1000,
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- 1. 【修改】Slant 风格 (极简斜体)
        -- 线条轻盈，完全扁平，非常有速度感
        dashboard.section.header.val = {
            [[    _   __                _           ]],
            [[   / | / /__  ____ _   __(_)___ ___   ]],
            [[  /  |/ / _ \/ __ \ | / / / __ `__ \  ]],
            [[ / /|  /  __/ /_/ / |/ / / / / / / /  ]],
            [[/_/ |_/\___/\____/|___/_/_/ /_/ /_/   ]],
        }

        -- 2. 菜单配置 (保持原样)
        dashboard.section.buttons.val = {
            dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
            dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
            dashboard.button("c", "  Config", ":e $MYVIMRC <CR>"),
            dashboard.button("q", "  Quit", ":qa<CR>"),
        }

        -- 3. 【核心布局调整】(保持你习惯的 padding = 16)
        dashboard.config.layout = {
            { type = "padding", val = 18 },
            dashboard.section.header,
            { type = "padding", val = 2 },
            dashboard.section.buttons,
        }

        -- 4. 启动配置
        alpha.setup(dashboard.config)

        -- 5. 劫持逻辑 (保持原样)
        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                local arg = vim.fn.argv(0)
                if arg and arg ~= "" and vim.fn.isdirectory(arg) == 1 then
                    vim.cmd.cd(arg)
                    local dir_buf = vim.api.nvim_get_current_buf()
                    require("alpha").start(false)
                    vim.cmd("bwipeout " .. dir_buf)
                end
            end,
        })
    end,
}
