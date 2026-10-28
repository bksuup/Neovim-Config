local setup = function()
  local conform = require("conform")
  conform.setup({
    formatters_by_ft = {
      -- lua = { "stylua" },
      go = { "gofmt" },
    },
  })

  --[[
  -- Autocommand that formats the files on save
  -- If formatter is not available, conform fallbacks to lsp
  --]]
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("custom-conform", { clear = true }),
    callback = function(args)
      require("conform").format({
        bufnr = args.buf,
        lsp_format = "fallback",
        quiet = true,
      })
    end,
  })
end

return { setup = setup }
