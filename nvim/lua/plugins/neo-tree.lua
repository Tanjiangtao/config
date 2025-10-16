return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		-- vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>")
        -- 打开/关闭文件树
        vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
        -- 关闭文件树
        vim.keymap.set("n", "<leader>q", ":Neotree close<CR>", { desc = "Close Neo-tree" })
	end,
}
