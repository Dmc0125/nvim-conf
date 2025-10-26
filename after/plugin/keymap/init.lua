vim.g.mapleader = " "

local map = vim.keymap.set 

map("n", "<leader>pv", vim.cmd.Ex)

-- move lines up/down in visual mode
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "J", ":m '>+1<CR>gv=gv")

-- yank to system clipboard
map("n", "<leader>y", "\"+y")
map("v", "<leader>y", "\"+y")

-- jump by screen but stay in the middle
map("v", "<C-d>", "<C-d>zz")
map("v", "<C-u>", "<C-u>zz")

-- paste/delete while preserving the buffer
map("x", "<leader>p", "\"_dP")
map("n", "<leader>d", "\"_d")
map("v", "<leader>d", "\"_d")

-- remove Ctrl-x and Ctrl-o
map("n", "<C-o>", "<nop>")
map("i", "<C-x>", "<nop>")
-- map("i", "<C-x><C-o>", "<nop>")
-- map("c", "<C-x><C-o>", "<nop>")

-- split vertically and switch to new window
map("n", "<C-n>", ":vs<CR><C-w>w")
