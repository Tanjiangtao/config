-- Rust 特定设置
vim.g.rustfmt_autosave = 1  -- 保存时自动格式化（依赖 rustfmt）
vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
-- LSP 诊断显示
vim.diagnostic.config({
  virtual_text = true,  -- 显示行内诊断
  signs = true,
  underline = true,
  update_in_insert = false,
})

-- 启用 inlay hints（Rust 特定）
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    if vim.bo[args.buf].filetype == "rust" then
      vim.lsp.inlay_hint.enable(true)
    end
  end,
})

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
-- 添加自定义按键映射
vim.keymap.set("n", "J", "5j", { desc = "Move down 5 lines" })
vim.keymap.set("n", "K", "5k", { desc = "Move up 5 lines" })
-- 标签页跳转映射
vim.keymap.set("n", "<leader>tn", ":tabnext<CR>", { desc = "Next Tab" })
vim.keymap.set("n", "<leader>tp", ":tabprevious<CR>", { desc = "Previous Tab" })
vim.keymap.set("n", "<leader>t1", ":tabn 1<CR>", { desc = "Tab 1" })
vim.keymap.set("n", "<leader>t2", ":tabn 2<CR>", { desc = "Tab 2" })
vim.keymap.set("n", "<leader>t3", ":tabn 3<CR>", { desc = "Tab 3" })
vim.keymap.set("n", "<leader>tt", ":tabnew<CR>", { desc = "New Tab" })
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close Tab" })
