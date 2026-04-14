-- 算法竞赛测试用例管理工具 (CPH 的完美平替)
return {
    "xeluxee/competitest.nvim",
    dependencies = "MunifTanjim/nui.nvim", -- UI 依赖（你之前配 noice 的时候已经装过 nui 了，这里复用）
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
            -- 默认会在当前代码目录下生成一个文件同名的文件夹，专门存 in 和 out 文件
            local_build = true,

            -- 配置浮动窗口 UI
            float_ext_line_hl = false,
            window_position = "center",

            -- 如果你的终端支持真色彩，这里的 Diff 颜色会非常直观
            testcases_use_single_file = false,

            -- 编译和运行命令配置 (默认已经支持大部分语言，这里显式写出 C++/Rust 防止出锅)
            compile_command = {
                c = { exec = "gcc", args = { "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
                cpp = { exec = "g++", args = { "-Wall", "-O2", "-std=c++17", "$(FNAME)", "-o", "$(FNOEXT)" } },
                rust = { exec = "rustc", args = { "$(FNAME)" } },
                python = { exec = "python3", args = { "-m", "py_compile", "$(FNAME)" } },
            },
            run_command = {
                c = { exec = "./$(FNOEXT)" },
                cpp = { exec = "./$(FNOEXT)" },
                rust = { exec = "./$(FNOEXT)" },
                python = { exec = "python3", args = { "$(FNAME)" } },
            },
        })
    end,
}
