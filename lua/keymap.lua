vim.g.mapleader = " "

vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("n", "<leader>oi", ":Oil <CR>")

vim.keymap.set("n", "<C-w><Up>", "<C-w>k")    -- Move up
vim.keymap.set("n", "<C-w><Down>", "<C-w>j")  -- Move down
vim.keymap.set("n", "<C-w><Left>", "<C-w>h")  -- Move left
vim.keymap.set("n", "<C-w><Right>", "<C-w>l") -- Move right

vim.keymap.set("v", "<C-Down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-Up>", ":m '<-2<CR>gv=gv")
