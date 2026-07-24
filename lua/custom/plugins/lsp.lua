return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",

      -- Autoformatting
      "stevearc/conform.nvim",

      -- Schema Information
      "b0o/SchemaStore.nvim",
    },
    config = function()
      require("mason").setup()

      -- LSP's --
      require("mason-lspconfig").setup({
        automatic_installation = false,
        ensure_installed = {
          "lua_ls",
          "gopls",
          "jsonls",
          "yamlls",
          "terraformls",
        },
      })

      -- Tools --
      require("mason-tool-installer").setup({
        ensure_installed = {
          "stylua",
          "markdownlint",
        },
      })

      -- Config for LSP-servers

      vim.lsp.config("lua_ls", {})
      vim.lsp.config("gopls", {})
      vim.lsp.config("terraformls", {})

      vim.lsp.config("jsonls", {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      })

      vim.lsp.config("yamlls", {
        settings = {
          yaml = {
            format = {
              enable = true,
              singleQuote = true,
            },
            schemas = require("schemastore").yaml.schemas(),
          },
        },
      })

      -- Autoformatting --
      require("custom.autoformat").setup()

      vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
    end,
  },
}
