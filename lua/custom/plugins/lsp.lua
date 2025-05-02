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
          "ansiblels",
        },
      })

      -- Tools --
      require("mason-tool-installer").setup({
        ensure_installed = {
          "stylua",
        },
      })

      require("lspconfig").lua_ls.setup({})

      require("lspconfig").gopls.setup({})

      require("lspconfig").jsonls.setup({
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
          },
        },
      })

      require("lspconfig").yamlls.setup({
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

      require("lspconfig").ansiblels.setup({})

      -- require("lspconfig").bicep.setup({})

      -- Autoformatting --
      require("custom.autoformat").setup()

      vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
    end,
  },
}
