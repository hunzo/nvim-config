return {
	"xiyaowong/nvim-transparent",
	config = function()
		require("transparent").setup({
			enable = true,
			extra_groups = {
				"BufferLineTabClose",
				"BufferlineBufferSelected",
				"BufferLineFill",
				"BufferLineBackground",
				"BufferLineSeparator",
				"BufferLineIndicatorSelected",
			},
			exclude = {},
		})
	end,
}
