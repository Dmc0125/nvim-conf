local lspconfig = require("lspconfig")


vim.diagnostic.config({
    virtual_text = {
        spacing = 4,
        prefix = "!", -- Lightbulb icon, requires a patched font (Nerd Font)
        source = "always",
    },
    signs = true,
    update_in_insert = true,
    severity_sort = true,
})

local on_attach = function(client, bufnr)
    -- Options for buffer-local keymaps
    local opts = { noremap = true, silent = true, buffer = bufnr }
    local map = vim.keymap.set

    -- Recommended keymaps for LSP functions
    -- See `:help vim.lsp.buf` for a full list of functions
    map("n", "gd", vim.lsp.buf.definition, opts)                   -- Go to definition
    map("n", "gD", vim.lsp.buf.type_definition, opts)              -- Go to type definition
    map("n", "gi", vim.lsp.buf.implementation, opts)               -- Go to implementation
    map("n", "gr", vim.lsp.buf.references, opts)                   -- Find references
    map("n", "K", vim.lsp.buf.hover, opts)                         -- Show hover documentation
    map("i", "<C-S>", vim.lsp.buf.signature_help, opts)            -- Show signature help (in Insert mode)
    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- Code actions

    -- Custom rename keymap (as discussed before)
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
    map("n", "[d", vim.diagnostic.goto_prev, opts) -- Go to previous diagnostic
    map("n", "]d", vim.diagnostic.goto_next, opts) -- Go to next diagnostic
    -- map("n", "<leader>q", vim.diagnostic.set_loclist, opts)  -- Populate quickfix list with diagnostics
    -- map("n", "<leader>e", vim.diagnostic.open_float, opts)   -- Open float with current diagnostic

    -- Autoformat on save
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("LspFormatting." .. client.name, { clear = true }),
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
        end,
    })

    -- Optionally, highlight symbol references under cursor
    vim.api.nvim_create_autocmd("CursorHold", {
        group = vim.api.nvim_create_augroup("LspHighlight." .. client.name, { clear = true }),
        buffer = bufnr,
        callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
        group = vim.api.nvim_create_augroup("LspHighlight." .. client.name, { clear = true }),
        buffer = bufnr,
        callback = vim.lsp.buf.clear_references,
    })
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
})

lspconfig.gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
