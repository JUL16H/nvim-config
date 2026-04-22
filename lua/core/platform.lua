local M = {}

M.is_win = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
M.is_linux = vim.fn.has("unix") == 1 and not M.is_win
M.is_mac = vim.fn.has("macunix") == 1

function M.join(...)
    return vim.fs.joinpath(...)
end

function M.stdpath(kind, ...)
    return vim.fs.joinpath(vim.fn.stdpath(kind), ...)
end

function M.executable(cmd)
    return vim.fn.executable(cmd) == 1
end

function M.first_executable(candidates)
    for _, cmd in ipairs(candidates) do
        if vim.fn.executable(cmd) == 1 then
            return cmd
        end
    end
    return nil
end

return M
