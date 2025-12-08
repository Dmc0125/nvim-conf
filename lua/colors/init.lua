vim.cmd("colorscheme default")

local colors = {
    sky_blue = "#74d4ff",
    pink = "#cf609b",
    orange = "#ff7e57",
    grey = "#bdc4cd",
    white = "#e3eaf4",
    dark_grey = "#626870",
    light_grey = "#242830",
    bg = "#191d25",
}


vim.api.nvim_set_hl(0, "WinSeparator", { fg = colors.dark_grey })
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = colors.dark_grey })

vim.api.nvim_set_hl(0, "Normal", { bg = colors.bg })
vim.api.nvim_set_hl(0, "ColorColumn", { bg = colors.light_grey })

-- Tree sitter

vim.api.nvim_set_hl(0, "@string", { fg = colors.sky_blue, force = true })
vim.api.nvim_set_hl(0, "@string.regexp", { fg = colors.sky_blue, force = true })

vim.api.nvim_set_hl(0, "@function", { fg = colors.pink })
vim.api.nvim_set_hl(0, "Special", { fg = colors.pink })
vim.api.nvim_set_hl(0, "@type", { fg = colors.pink })
vim.api.nvim_set_hl(0, "@type.builtin", { fg = colors.pink })

vim.api.nvim_set_hl(0, "@constant", { fg = colors.orange })
vim.api.nvim_set_hl(0, "Constant", { fg = colors.orange })

vim.api.nvim_set_hl(0, "@keyword", { fg = colors.grey })
vim.api.nvim_set_hl(0, "@variable.member", { fg = colors.grey })
vim.api.nvim_set_hl(0, "@property", { fg = colors.grey })

vim.api.nvim_set_hl(0, "@variable", { fg = colors.white })

vim.api.nvim_set_hl(0, "@comment", { fg = colors.dark_grey })

vim.api.nvim_set_hl(0, "@tag", { fg = colors.pink })
vim.api.nvim_set_hl(0, "@tag.attribute", { fg = colors.grey })
vim.api.nvim_set_hl(0, "@none", { fg = colors.white })
