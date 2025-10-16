vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
-- 添加自定义按键映射
vim.keymap.set("n", "J", "5j", { desc = "Move down 5 lines" })
vim.keymap.set("n", "K", "5k", { desc = "Move up 5 lines" })
