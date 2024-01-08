return {
  "xiyaowong/nvim-transparent",
  config = function()
    require("transparent").setup({
      extra_groups = {
        "BufferLineTabClose",
        "BufferlineBufferSelected",
        "BufferLineFill",
        "BufferLineBackground",
        "BufferLineSeparator",
        "BufferLineIndicatorSelected",
      },
      exclude_groups = {},
    })
  end,
}
