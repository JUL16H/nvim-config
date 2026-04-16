return {
    "xeluxee/competitest.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    cmd = "CompetiTest",
    keys = {
        { "<leader>cr", "<cmd>CompetiTest run<CR>", desc = "CP: Run Testcases (运行测试)" },
        { "<leader>ca", "<cmd>CompetiTest add_testcase<CR>", desc = "CP: Add Testcase (添加样例)" },
        { "<leader>ce", "<cmd>CompetiTest edit_testcase<CR>", desc = "CP: Edit Testcase (编辑样例)" },
        { "<leader>cd", "<cmd>CompetiTest delete_testcase<CR>", desc = "CP: Delete Testcase (删除样例)" },
        { "<leader>cp", "<cmd>CompetiTest receive testcases<CR>", desc = "CP: Receive Testcases (接收样例)" },
    },
    config = function()
        require("competitest").setup({
            -- 1. 将测试用例统一放进 .testcases 隐藏文件夹
            testcases_directory = ".testcases",
            -- 依然保留单文件模式，这样 .testcases 文件夹内会整洁地按题目名保存为独立文件
            testcases_use_single_file = true,

            -- 配置浮动窗口 UI
            float_ext_line_hl = false,
            window_position = "center",

            -- 2. 将编译的 .out 文件统一定向到系统内存盘 /tmp 下
            compile_command = {
                c = { exec = "gcc", args = { "-Wall", "$(FNAME)", "-o", "/tmp/$(FNOEXT).out" } },
                cpp = { exec = "g++", args = { "-Wall", "-O2", "-std=c++17", "$(FNAME)", "-o", "/tmp/$(FNOEXT).out" } },
                rust = { exec = "rustc", args = { "$(FNAME)", "-o", "/tmp/$(FNOEXT).out" } },
                python = { exec = "python3", args = { "-m", "py_compile", "$(FNAME)" } },
            },

            -- 3. 运行命令也同步指向 /tmp 目录下的产物
            run_command = {
                c = { exec = "/tmp/$(FNOEXT).out" },
                cpp = { exec = "/tmp/$(FNOEXT).out" },
                rust = { exec = "/tmp/$(FNOEXT).out" },
                python = { exec = "python3", args = { "$(FNAME)" } },
            },
        })
    end,
}
