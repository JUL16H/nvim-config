return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    priority = 1000,
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- 1. 修复后的 ASCII Art (严格使用空格排版，避免因 Tab 错乱)
        dashboard.section.header.val = {
            [[      _   __                _          ]],
            [[     / | / /__  ____ _   __(_)___ ___  ]],
            [[    /  |/ / _ \/ __ \ | / / / __ `__ \ ]],
            [[   / /|  /  __/ /_/ / |/ / / / / / / / ]],
            [[  /_/ |_/\___/\____/|___/_/_/ /_/ /_/  ]],
        }

        -- 【备选方案】如果你想换一种字体，可以注释掉上面那段，解开下面这段：
        -- dashboard.section.header.val = {
        --     [[                               __                ]],
        --     [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
        --     [[ /' _ `\  / __`\ / __`\/\ \/\ \\/\ \ /' __` __`\ ]],
        --     [[ /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \]],
        --     [[ \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
        --     [[  \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
        -- }

        -- 快捷按钮
        dashboard.section.buttons.val = {
            dashboard.button("e", "  File Explorer", ":Oil --float <CR>"),
            dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
            dashboard.button(
                "c",
                "  Config",
                "<cmd>lua vim.cmd.cd(vim.fn.stdpath('config'))<CR><cmd>e $MYVIMRC<CR>"
            ),
            dashboard.button("q", "  Quit", ":qa<CR>"),
        }

        -- 2. 美化底部信息
        dashboard.section.footer.val = function()
            local cwd = vim.fn.getcwd()
            -- 将 /home/user 替换为 ~，视觉上更干净
            local short_cwd = vim.fn.fnamemodify(cwd, ":~")
            return "󰉖  " .. short_cwd
        end
        -- 明确设置居中和颜色高亮
        dashboard.section.footer.opts.hl = "Comment"
        dashboard.section.footer.opts.position = "center"

        -- 3. 调整整体高度，使其视觉重心稍微偏上
        local function get_padding()
            local screen_height = vim.o.lines
            -- 估算内容总高度: header(5) + 间距(2) + 按钮(4) + 间距(3) + footer(1) = 15行
            local content_height = 15
            -- 在绝对居中基础上，向上偏移 4 行 (你可以微调这个数字 "- 4")
            local padding = math.floor((screen_height - content_height) / 2) - 2
            return math.max(0, padding)
        end

        -- 组装 Layout
        dashboard.config.layout = {
            { type = "padding", val = get_padding },
            dashboard.section.header,
            { type = "padding", val = 2 },
            dashboard.section.buttons,
            { type = "padding", val = 2 }, -- 稍微拉开路径与上方按钮的距离
            dashboard.section.footer,
        }

        alpha.setup(dashboard.config)

        -- 处理从终端打开目录的逻辑
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

        -- 窗口自适应刷新
        vim.api.nvim_create_autocmd("VimResized", {
            callback = function()
                if vim.bo.filetype == "alpha" then
                    vim.cmd("AlphaRedraw")
                end
            end,
        })
    end,
}
