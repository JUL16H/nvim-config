return {
    "mfussenegger/nvim-dap",
    -- 推荐把按键映射写在 keys 里，这样直到你真的按下了调试快捷键，才会加载庞大的 DAP 相关插件，提升 Neovim 启动速度
    keys = {
        {
            "<leader>b",
            function()
                require("dap").toggle_breakpoint()
            end,
            desc = "Toggle Breakpoint",
        },
        {
            "<F5>",
            function()
                require("dap").continue()
            end,
            desc = "Debug: Start/Continue",
        },
        {
            "<F10>",
            function()
                require("dap").step_over()
            end,
            desc = "Debug: Step Over",
        },
        {
            "<F11>",
            function()
                require("dap").step_into()
            end,
            desc = "Debug: Step Into",
        },
        {
            "<F12>",
            function()
                require("dap").step_out()
            end,
            desc = "Debug: Step Out",
        },
        {
            "<leader>du",
            function()
                require("dapui").toggle()
            end,
            desc = "Debug: Toggle UI",
        },
        {
            "<leader>dt",
            function()
                require("dap").terminate()
            end,
            desc = "Debug: Terminate",
        },
    },
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

        -- 1. 虚拟文本配置
        require("nvim-dap-virtual-text").setup({
            commented = true, -- 将变量值作为注释显示，视觉上更清晰
        })

        -- 2. UI 面板配置
        dapui.setup({
            icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
            layouts = {
                {
                    -- 左侧面板：显示变量、监视、调用栈
                    elements = {
                        { id = "scopes", size = 0.50 },
                        { id = "watches", size = 0.25 },
                        { id = "stacks", size = 0.25 },
                    },
                    size = 40,
                    position = "left",
                },
                {
                    -- 底部面板：显示 REPL 控制台
                    elements = {
                        { id = "repl", size = 1.0 },
                    },
                    size = 10,
                    position = "bottom",
                },
            },
        })

        -- 3. Mason 自动安装调试适配器
        require("mason-nvim-dap").setup({
            -- 增加了 netcoredbg 以支持 C# 调试
            ensure_installed = { "codelldb", "python", "delve", "netcoredbg" },
            automatic_installation = true,
            handlers = {},
        })

        -- 4. 自定义断点图标 (使用了 Nerd Font 图标，视觉效果更现代)
        vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379", bg = "#31353f" })
        local sign = vim.fn.sign_define
        sign("DapBreakpoint", { text = "", texthl = "DiagnosticError", linehl = "", numhl = "" })
        sign("DapBreakpointCondition", { text = "", texthl = "DiagnosticWarn", linehl = "", numhl = "" })
        sign("DapLogPoint", { text = "", texthl = "DiagnosticInfo", linehl = "", numhl = "" })
        sign("DapStopped", { text = "", texthl = "DiagnosticOk", linehl = "DapStopped", numhl = "DapStopped" })

        -- 5. 自动打开/关闭调试面板
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end
    end,
}
