return {
  "sindrets/diffview.nvim",
  -- lazy = true,
  event = "VeryLazy",
  -- cmd = "Diffview Open",
  -- require("Diffview").setup({
  keys = {
    { "<leader>gd", "<cmd>DiffviewFileHistory % <cr>", desc = "Diffview Current File" },
    { "<leader>gD", "<cmd>DiffviewFileHistory <cr> ", desc = "Diffview Current Branch" },
  },
}
