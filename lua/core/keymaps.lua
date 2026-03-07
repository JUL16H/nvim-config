vim.g.mapleader = " "
vim.keymap.set("i", "jj", "<ESC>")
vim.keymap.set("n", "<leader>s", "<Cmd>w<CR>", { silent = true })
vim.keymap.set("n", "<leader>q", "<Cmd>qa<CR>", { silent = true })
vim.keymap.set("n", "<leader><leader>q", "<Cmd>q<CR>", { silent = true })
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
