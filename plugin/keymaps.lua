--[[
-- For more inspiration:
-- https://github.com/tjdevries/config.nvim/blob/master/plugin/keymaps.lua
--]]

local set = vim.keymap.set

set("n", "<leader>pv", vim.cmd.Ex)

set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show Diagnostic" })

set("n", "<leader>x", "<cmd>.lua<CR>", { desc = "Execute the current line" })
set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })

set("n", "<space>tt", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })
end)
