return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<C-n>", ":Neotree toggle filesystem reveal left<CR>", opts)
		vim.keymap.set("n", "<leader>bf", ":Neotree toggle buffers reveal float<CR>", opts)
	end,
}
