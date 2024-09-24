return {
  -- "kylechui/nvim-surround",
  "echasnovski/mini.surround",
  opts = {
    -- mappings = {
    --   add = "sa", -- add surrounding in normal and visual modes
    --   delete = "sd", -- delete surrounding
    --   find = "sf", -- find surrounding (to the right)
    --   find_left = "sf", -- find surrounding (to the left)
    --   highlight = "sh", -- highlight surrounding
    --   replace = "sr", -- replace surrounding
    --   update_n_lines = "sn", -- update `n_lines`
    --
    --   suffix_last = "l", -- suffix to search with "prev" method
    --   suffix_next = "n", -- suffix to search with "next" method
    -- },
    mappings = {
      add = "sa", -- add surrounding in normal and visual modes
      delete = "sd", -- delete surrounding
      find = "gsf", -- find surrounding (to the right)
      find_left = "gsf", -- find surrounding (to the left)
      highlight = "gsh", -- highlight surrounding
      replace = "gsr", -- replace surrounding
      update_n_lines = "gsn", -- update `n_lines`
    },
  },
}

-- function m.config()
-- vim.keymap.set("n", "s", "<nop>")
-- require("nvim-surround").setup({
--   keymaps = {
--     insert = "<c-g>s",
--     insert_line = "<c-g>sl",
--     normal = "sa",
--     normal_cur = "sl",
--     normal_line = "yss",
--     normal_cur_line = "sal",
--     visual = "sa",
--     visual_line = "sal",
--     delete = "ds",
--     change = "cs",
--   },
--   aliases = {
--     ["a"] = ">",
--     ["p"] = ")",
--     ["c"] = "}",
--     ["b"] = "]",
--     ["q"] = { '"', "'", "`" },
--     ["s"] = { "}", "]", ")", ">", '"', "'", "`" },
--   },
--   move_cursor = false,
-- })
-- end
