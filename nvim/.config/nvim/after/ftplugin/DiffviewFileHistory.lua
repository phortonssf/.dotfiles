local M = {}
function M.setup() end

function M.Ftplugin()
  local bufnr = vim.api.nvim_get_current_buf()

  local bufMap = vim.api.nvim_buf_set_keymap
  bufMap(bufnr, "n", "<c-p>", "", {
    callback = function()
      require("diffview.config").actions.select_prev_entry()
    end,
    desc = "Diff Prev",
    noremap = true,
    silent = true,
  })

  bufMap(bufnr, "n", "<c-n>", "", {
    callback = function()
      require("diffview.config").actions.select_next_entry()
    end,
    desc = "Diff Next",
    noremap = true,
    silent = true,
  })
  bufMap(bufnr, "n", "<leader><tab>q", "<cmd> DiffviewClose <cr>", {
    desc = "Diff Close",
    noremap = true,
    silent = true,
  })
  bufMap(bufnr, "n", "<localleader>q", "<cmd> DiffviewClose <cr>", {
    desc = "Diff Close",
    noremap = true,
    silent = true,
  })

  require("which-key").add({})
end
return M.Ftplugin()
