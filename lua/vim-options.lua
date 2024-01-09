vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.transparent_enabled = true

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Navigate vim panes better
-- keymap.set("n", "<c-k>", ":wincmd k<CR>", opts)
-- keymap.set("n", "<c-j>", ":wincmd j<CR>", opts)
-- keymap.set("n", "<c-h>", ":wincmd h<CR>", opts)
-- keymap.set("n", "<c-l>", ":wincmd l<CR>", opts)

-- Move window
keymap.set("n", "sh", "C-w>h")
keymap.set("n", "sk", "C-w>k")
keymap.set("n", "sj", "C-w>j")
keymap.set("n", "sl", "C-w>l")

keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.wo.number = true

-- New tab
keymap.set("n", "te", ":tabedit", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<S-tab>", ":tabprev<Return>", opts)

-- increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- resize windows
keymap.set("n", "<C-w><left>", "<C-w><", opts)
keymap.set("n", "<C-w><right>", "<C-w>>", opts)
keymap.set("n", "<C-w><up>", "<C-w>+", opts)
keymap.set("n", "<C-w><down>", "<C-w>-", opts)

-- diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)
