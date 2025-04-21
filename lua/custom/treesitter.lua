local M = {}

M.setup = function()
  require("nvim-treesitter").setup({
    ensure_install = {
      "bash",
      "vim",
      "vimdoc",
      "bash",
      "go",
      "gomod",
      "gowork",
      "gosum",
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
      "sql",
      "toml",
      "csv",
      "diff",
    },
    auto_install = true,
    sync_install = false,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
    },
  })
end

return M
