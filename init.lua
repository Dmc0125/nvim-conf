vim.opt.shell = "/bin/bash" -- or /bin/sh, /bin/zsh
vim.opt.shellcmdflag = "-c"
vim.opt.shellquote = ""
vim.opt.shellxquote = ""

require("lazynvim").bootstrap()
require("settings")
require("lsp")
require("colors")
require("treesitter.injections")
