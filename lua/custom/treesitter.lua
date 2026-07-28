local M = {}

M.setup = function()
  require("nvim-treesitter").setup({
    install_dir = vim.fn.stdpath("data") .. "/site",
  })

  local parsers = {
    "bash",
    "vim",
    "vimdoc",
    "go",
    "gomod",
    "gowork",
    "gosum",
    "cue",
    "python",
    "toml",
    "sql",
    "yaml",
    "json",
    "lua",
    "dockerfile",
    "gitignore",
    "git_config",
    "gitcommit",
    "hcl",
    "html",
    "markdown",
    "markdown_inline",
    "regex",
    "requirements",
    "csv",
    "diff",
  }

  require("nvim-treesitter").install(parsers)

  vim.api.nvim_create_autocmd("FileType", {
    pattern = parsers,
    callback = function()
      vim.treesitter.start()
    end,
  })
end

return M
