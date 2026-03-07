return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-neotest/nvim-nio",
        "williamboman/mason.nvim",
        "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        dapui.setup()

        require("nvim-dap-virtual-text").setup()

        require("mason-nvim-dap").setup({
            ensure_installed = { "codelldb", "python", "delve" },
            automatic_installation = true,
            handlers = {}, -- 默认自动配置 handler
        })

        local sign = vim.fn.sign_define
        sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
        sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
        sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })

        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        local keymap = vim.keymap.set

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
