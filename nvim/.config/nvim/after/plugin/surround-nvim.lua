require("nvim-surround").setup({
  -- Configuration here, or leave empty to use defaults
   keymaps = {
        insert = "<C-_>s",
        insert_line = "<C-_>S",
        normal = "s",
        normal_cur = "sl",
        normal_line = "sa",
        normal_cur_line = "sal",
        visual = "s",
        visual_line = "sa",
        delete = "sd",
        change = "sc",
    },
  aliases = {
    ["a"] = ">",
    ["b"] = ")",
    ["B"] = "}",
    ["r"] = "]",
    ["q"] = { '"', "'", "`" },
    ["s"] = { "}", "]", ")", ">", '"', "'", "`" },
  },
})
