local platform = require("core.platform")

local bin_dir = platform.stdpath("cache", "competitest")
if vim.fn.isdirectory(bin_dir) == 0 then
    vim.fn.mkdir(bin_dir, "p")
end

local exe_suffix = platform.is_win and ".exe" or ".out"
local out_file = platform.join(bin_dir, "$(FNOEXT)" .. exe_suffix)
local py = platform.first_executable({ "python3", "python" }) or "python"

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
            testcases_directory = ".testcases",
            testcases_use_single_file = true,
            float_ext_line_hl = false,
            window_position = "center",

            compile_command = {
                c = { exec = "gcc", args = { "-Wall", "$(FNAME)", "-o", out_file } },
                cpp = { exec = "g++", args = { "-Wall", "-O2", "-std=c++17", "$(FNAME)", "-o", out_file } },
                rust = { exec = "rustc", args = { "$(FNAME)", "-o", out_file } },
                python = { exec = py, args = { "-m", "py_compile", "$(FNAME)" } },
            },

            run_command = {
                c = { exec = out_file },
                cpp = { exec = out_file },
                rust = { exec = out_file },
                python = { exec = py, args = { "$(FNAME)" } },
            },
        })
    end,
}
