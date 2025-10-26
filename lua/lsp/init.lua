vim.diagnostic.config({
    virtual_text = {
        spacing = 4,
        prefix = "!", -- Lightbulb icon, requires a patched font (Nerd Font)
        source = true,
    },
    signs = true,
    update_in_insert = true,
    severity_sort = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

        local map = vim.keymap.set
        local bufnr = args.buf
        local opts = { buffer = bufnr, noremap = true, silent = true }

        map("n", "gd", vim.lsp.buf.definition, opts)
        map("n", "K", vim.lsp.buf.hover, opts)
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        -- rename all references
        map("n", "<leader>rn", function()
            local cmdId
            cmdId = vim.api.nvim_create_autocmd({ "CmdlineEnter" }, {
                callback = function()
                    local key = vim.api.nvim_replace_termcodes("<C-f>", true, false, true)
                    vim.api.nvim_feedkeys(key, "c", false)
                    vim.api.nvim_feedkeys("0", "n", false)
                    cmdId = nil
                    return true
                end,
            })
            vim.lsp.buf.rename()
            vim.defer_fn(function()
                if cmdId then
                    vim.api.nvim_del_autocmd(cmdId)
                end
            end, 500)
        end, opts)

        -- Diagnostics keymaps
        map("n", "[d", function()
            vim.diagnostic.jump { count = 1, float = true }
        end, opts)
        map("n", "]d", function()
            vim.diagnostic.jump { count = -1, float = true }
        end, opts)

        -- format
        map("n", "<leader>f", vim.lsp.buf.format)

        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("LspFormatting." .. client.name, { clear = true }),
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format()
            end,
        })
    end
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("*", {
    capabilities = capabilities,
})

vim.lsp.config.luals = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = {
                enabled = false,
            },
        }
    }
}

vim.lsp.enable({
    "luals",
    "gopls",
})
