local M = {
  "edluffy/specs.nvim",
  enable = true,
}

function M.config()
  require("specs").setup({
    show_jumps = true,
    min_jump = 10,
    popup = {
      delay_ms = 0, -- delay before popup displays
      inc_ms = 12, -- time increments used for fade/resize effects
      blend = 50, -- starting blend, between 0-100 (fully transparent), see :h winblend
      width = 15,
      winhl = "PMenu",
      fader = require("specs").pulse_fader,
      resizer = require("specs").shrink_resizer,
    },
    ignore_filetypes = {},
    ignore_buftypes = {
      nofile = true,
    },
  })
  vim.keymap.set("n", "n", 'n:lua require("specs").show_specs()<CR>', { noremap = true, silent = true })
  vim.keymap.set("n", "N", 'N:lua require("specs").show_specs()<CR>', { noremap = true, silent = true })
end

return M
