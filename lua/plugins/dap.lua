return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-neotest/nvim-nio", -- nvim-dap-ui 的依赖
        "williamboman/mason.nvim", -- 确保你安装了 Mason
        "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        -- 1. 配置 UI
        dapui.setup()

        -- 2. 配置 Virtual Text (行内显示变量值)
        require("nvim-dap-virtual-text").setup()

        -- 3. 配置 Mason-Nvim-Dap (自动安装/配置调试器)
        require("mason-nvim-dap").setup({
            -- 自动安装常用的调试器，根据你的需求修改
            -- 例如：python用 "debugpy", c++/rust用 "codelldb"
            ensure_installed = { "codelldb", "python", "delve" },
            automatic_installation = true,
            handlers = {}, -- 默认自动配置 handler
        })

        -- 4. 美化断点图标 (需要 Nerd Fonts)
        local sign = vim.fn.sign_define
        sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
        sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
        sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })

        -- 5. 监听事件：调试开始时自动打开 UI，结束时自动关闭
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        -- 6. 快捷键配置 (仿 VS Code)
        local keymap = vim.keymap.set

        -- 打断点 (Leader + b)
        keymap("n", "<leader>b", function()
            dap.toggle_breakpoint()
        end, { desc = "Toggle Breakpoint" })

        -- 继续/开始调试 (F5)
        keymap("n", "<F5>", function()
            dap.continue()
        end, { desc = "Debug: Start/Continue" })

        -- 单步跳过 (F10)
        keymap("n", "<F10>", function()
            dap.step_over()
        end, { desc = "Debug: Step Over" })

        -- 单步进入 (F11)
        keymap("n", "<F11>", function()
            dap.step_into()
        end, { desc = "Debug: Step Into" })

        -- 单步跳出 (F12)
        keymap("n", "<F12>", function()
            dap.step_out()
        end, { desc = "Debug: Step Out" })

        -- 打开/关闭调试界面 (Leader + d + u)
        keymap("n", "<leader>du", function()
            dapui.toggle()
        end, { desc = "Debug: Toggle UI" })
    end,
}
