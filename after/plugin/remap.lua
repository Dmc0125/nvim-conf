-- explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move lines up/down in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

-- jump by screen but stay in the middle
vim.keymap.set("v", "<C-d>", "<C-d>zz")
vim.keymap.set("v", "<C-u>", "<C-u>zz")

-- paste/delete while preserving the buffer
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- remove Ctrl-x and Ctrl-o
vim.keymap.set("n", "<C-o>", "<nop>")
vim.keymap.set("i", "<C-x>", "<nop>")
-- vim.keymap.set("i", "<C-x><C-o>", "<nop>")
-- vim.keymap.set("c", "<C-x><C-o>", "<nop>")

vim.keymap.set("i", "<C-l>", "<Esc>:put =''<CR>i")

-- Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- toggle comment in insert mode, is Ctrl + / but alacritty is sending
-- Ctrl + _, and also moves cursor for some reason,
-- gcc on it's own does not
vim.keymap.set("i", "<C-_>", "<Esc>gcci", { remap = true })

vim.keymap.set("n", "<C-n>", ":vs<CR><C-w>w")
