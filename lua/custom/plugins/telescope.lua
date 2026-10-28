return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          -- Lua patterns: anchor to path segments and escape "." so "env" does not hide environment.go
          file_ignore_patterns = { "^venv/", "/venv/", "virt_env/", "^env/", "/env/", "%.idea/", "%.git/" },
        },
        pickers = {
          find_files = {
            theme = "ivy",
            hidden = true,
          },
        },
      })
      require("telescope").load_extension("fzf")

      local telescope = require("telescope.builtin")

      vim.keymap.set("n", "<leader>fh", telescope.help_tags)
      vim.keymap.set("n", "<leader>fd", telescope.find_files)
      vim.keymap.set("n", "<leader>fg", telescope.git_files, {})
      vim.keymap.set("n", "<leader>ps", telescope.live_grep)
    end,
  },
}
