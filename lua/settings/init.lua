vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = "80"
vim.opt.wrap = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.updatetime = 50

local undopath = vim.fn.stdpath("cache") .. "/.nvimundo"
vim.opt.undodir = undopath
if vim.fn.isdirectory(undopath) == 0 then
    vim.fn.mkdir(undopath, "p")
end
vim.opt.undofile = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.hlsearch = false
vim.opt.incsearch = true
