-- 行号
vim.opt.number = true
vim.opt.relativenumber = true

-- 高亮行
vim.opt.cursorline = true

-- 搜索
vim.opt.ignorecase = true -- 忽略大小写
vim.opt.smartcase = true -- 输入大写则只搜素大写
vim.opt.hlsearch = true -- 高亮显示搜索结果
vim.opt.incsearch = true -- 输入时事实显示搜索位置

-- 禁用模式显示
vim.opt.showmode = false

-- 开启真彩显示
vim.opt.termguicolors = true

-- 始终显示符号列
vim.opt.signcolumn = "yes"

-- 缩进相关
vim.opt.tabstop = 4      -- Tab 键显示的宽度
vim.opt.shiftwidth = 4   -- 自动缩进或手动缩进(>>/<<)的宽度
vim.opt.expandtab = true -- 将 Tab 键自动展开为空格
vim.opt.softtabstop = 4  -- 编辑模式下按退格键(Backspace)一次删除4个空格
vim.opt.smartindent = true -- 智能缩进

-- 自动加载外部修改
vim.opt.autoread = true

-- 使用系统剪贴板
vim.opt.clipboard = "unnamedplus"

-- 分屏方向
vim.opt.splitbelow = true
vim.opt.splitright = true

-- 历史操作持久化
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.local/share/nvim/undo")

-- axaml视为XML
vim.filetype.add({
  extension = {
    axaml = "xml",
  },
})

-- 取消注释黏着
local group = vim.api.nvim_create_augroup("DisableAutoComment", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*", -- 针对所有文件类型
  group = group,
  callback = function()
    -- formatoptions 参数解释：
    -- r: 插入模式回车自动插入注释
    -- o: 普通模式 'o' 或 'O' 自动插入注释
    -- c: 当注释超过 textwidth 时自动换行并添加注释符

    -- 使用 remove 确保把这些标志彻底移除
    vim.opt_local.formatoptions:remove({ 'r', 'o', 'c' })
  end,
})
