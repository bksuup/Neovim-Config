--[ Mostly stolen from https://github.com/mathias-ws/nvim and https://github.com/ThePrimeagen/neovimrc --]

return {
    "VonHeikemen/lsp-zero.nvim",

    dependencies = {
        { "neovim/nvim-lspconfig" }, -- Required
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" }, -- Optional
        { "WhoIsSethDaniel/mason-tool-installer.nvim" },
        -- Autocompletion
        { "hrsh7th/nvim-cmp" }, -- Required
        { "hrsh7th/cmp-nvim-lsp" }, -- Required
        { "L3MON4D3/LuaSnip" }, -- Required
    },

    config = function()

        require("mason").setup()

        local lsp = require("lsp-zero")
        local mason_tool_installer = require("mason-tool-installer")
        local mason_lspconfig = require("mason-lspconfig")

        lsp.on_attach(function(client, bufnr)
            local opts = {buffer = bufnr, remap = false}
            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        end)

        lsp.omnifunc.setup({
            tabcomplete = true,
            use_fallback = true,
            update_on_delete = true,
        })


        mason_lspconfig.setup({
            ensure_installed = {
                "lua_ls",
                "perlnavigator",
                "yamlls",
                "bashls",
                "ansiblels",
                "gopls",
                "terraformls",
            }
        })


        mason_tool_installer.setup({
            ensure_installed = {
                "yamllint",
                "ansible-lint",
            }
        })

        require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
        --[ require("lspconfig").lua_ls.setup({}) --]

        require("lspconfig").perlnavigator.setup({})
        require("lspconfig").bashls.setup({})
        require("lspconfig").ansiblels.setup({})
        require("lspconfig").gopls.setup({})
        require("lspconfig").terraformls.setup({})

        require("lspconfig").pyright.setup({
            filetypes = { "python" },
        })

        require("lspconfig").yamlls.setup({
            settings = {
                yaml = {
                    format = {
                        enable = false,
                    },
                    validate = true,
                    completion = true,
                    hover = true,
                },
            },
        })

    end
}
