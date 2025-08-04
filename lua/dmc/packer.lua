return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'nvim-lua/plenary.nvim'
    use('nvim-telescope/telescope.nvim', { tag = '0.1.8' })

    use "https://github.com/neovim/nvim-lspconfig"

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use 'mbbill/undotree'

    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-vsnip"
    use "hrsh7th/vim-vsnip"

    -- use {
    --    'roobert/palette.nvim',
    --    lazy = false,
    --    priority = 1000,
    --    config = function()
    --        vim.cmd("colorscheme palette")
    --    end
    -- }

    -- use {
    --     "vague2k/vague.nvim",
    --     config = function()
    --         vim.cmd("colorscheme vague")
    --     end
    -- }
    use 'ThePrimeagen/vim-be-good'
    use {
        "lunacookies/vim-substrata",
        config = function()
            vim.cmd("colorscheme substrata")
        end
    }
end)
