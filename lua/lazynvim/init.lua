local M = {}

M.bootstrap = function()
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not (vim.uv or vim.loop).fs_stat(lazypath) then
        local lazyrepo = "https://github.com/folke/lazy.nvim.git"
        local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
        if vim.v.shell_error ~= 0 then
            vim.api.nvim_echo({
                { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
                { out,                            "WarningMsg" },
                { "\nPress any key to exit..." },
            }, true, {})
            vim.fn.getchar()
            os.exit(1)
        end
    end
    vim.opt.rtp:prepend(lazypath)

    -- neoscroll_setup()

    require("lazy").setup({
        spec = {
            {
                'nvim-telescope/telescope.nvim',
                tag = '0.1.8',
                dependencies = { 'nvim-lua/plenary.nvim' },
            },
            {
                "nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate",
            },
            "neovim/nvim-lspconfig",
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
            },

            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",

            "mbbill/undotree",

            "folke/zen-mode.nvim",

            "ThePrimeagen/vim-be-good",

            {
                "supermaven-inc/supermaven-nvim",
                config = function()
                    require("supermaven-nvim").setup({
                        condition = function()
                            return string.match(vim.fn.expand("%:t"), ".env")
                        end,
                    })
                end,
            },

            { "sindrets/diffview.nvim", config = { use_icons = false } },

            {
                "folke/tokyonight.nvim",
                lazy = false,
                priority = 1000,
                opts = {},
            },
            {
                "karb94/neoscroll.nvim",
                opts = {},
            },
        },
        checker = { enabled = false },
    })
end

return M
