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
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",

      { "j-hui/fidget.nvim", opts = {} },

      -- Autoformatting
      "stevearc/conform.nvim",

      -- Schema Information
      "b0o/SchemaStore.nvim",
    },
    config = function()
      require("mason").setup()

      -- LSP's --
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "gopls",
          "cue",
          "jsonls",
          "yamlls",
          "terraformls",
        },
      })

      -- Config for LSP-servers

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
              singleQuote = false,
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
