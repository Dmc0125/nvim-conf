vim.cmd("colorscheme default")

local colors = {
    sky_blue = "#74d4ff",
    pink = "#f6339a",
    orange = "#ff7e57",
    grey = "#bdc4cd",
    white = "#e3eaf4",
    dark_grey = "#626870",
}

vim.api.nvim_set_hl(0, "@string", { fg = colors.sky_blue, force = true })
vim.api.nvim_set_hl(0, "@string.regexp", { fg = colors.sky_blue, force = true })

vim.api.nvim_set_hl(0, "@function", { fg = colors.pink })
vim.api.nvim_set_hl(0, "@type", { fg = colors.pink })
vim.api.nvim_set_hl(0, "@type.builtin", { fg = colors.pink })

vim.api.nvim_set_hl(0, "@constant", { fg = colors.orange })

vim.api.nvim_set_hl(0, "@keyword", { fg = colors.grey })
vim.api.nvim_set_hl(0, "@variable.member", { fg = colors.grey })
vim.api.nvim_set_hl(0, "@property", { fg = colors.grey })

vim.api.nvim_set_hl(0, "@variable", { fg = colors.white })

vim.api.nvim_set_hl(0, "@comment", { fg = colors.dark_grey })

vim.api.nvim_set_hl(0, "WinSeparator", { fg = colors.dark_grey })
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = colors.dark_grey })

vim.api.nvim_set_hl(0, "Normal", { bg = "#191d25" })
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#242830" })
