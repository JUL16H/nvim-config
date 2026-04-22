if vim.fn.has("nvim-0.11") == 0 then
    vim.notify("This config requires Neovim >= 0.11", vim.log.levels.ERROR)
    return
end

if vim.loader then
    vim.loader.enable()
end

-- local arg = vim.fn.argv(0)
-- if arg and vim.fn.isdirectory(arg) == 1 then
--     vim.cmd.cd(arg)
-- end

require("core.basic")
require("core.keymaps")

if vim.g.neovide then
    require("core.neovide-config")
end

require("core.lazy")
