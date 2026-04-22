local platform = require("core.platform")

return {
    "h-hg/fcitx.nvim",
    enabled = platform.is_linux and (vim.fn.executable("fcitx5-remote") == 1 or vim.fn.executable("fcitx-remote") == 1),
    config = function() end,
}
