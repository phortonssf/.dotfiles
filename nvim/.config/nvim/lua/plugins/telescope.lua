return {
  "telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    "kkharji/sqlite.lua",
    "nvim-telescope/telescope-frecency.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
    "nvim-lua/plenary.nvim",
  },
  lazy = false,
  priority = 100,
  config = function()
    require("telescope").load_extension("fzf")
    require("plugins.telescope.setup")
    require("plugins.telescope.mappings")
  end,
  keys = {
    { "<leader>gs", false },
  },
}
