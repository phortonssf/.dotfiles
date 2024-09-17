local M = {}
function M.setup() end
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<localleader>", function()
  require("which-key").show("\\")
end, { buffer = true })

local wk = require("which-key")
M.wkopts = {
  mode = "n", -- NORMAL mode
  silent = true,
  noremap = false,
  nowait = false,
}

function M.whichkey(maps, opts)
  if opts == nil then
    opts = {}
  end
  wk.add(maps, vim.tbl_extend("keep", opts, M.wkopts))
end

function M.localleader(maps, opts)
  if opts == nil then
    opts = {}
  end

  M.whichkey(
    maps,
    vim.tbl_extend("keep", opts, {
      prefix = "<localleader>",
      buffer = 0,
    })
  )
end
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

  require("which-key").add({
    -- {
    --   "<localleader>q",
    --   "<cmd> DiffviewClose <cr>",
    --   desc = "Diff ViewClose",
    --   -- f = { "<cmd> DiffviewToggleFiles <cr>", "Toggle the file pane" },
    -- },
    -- {
    --
    --   "<c-p>",
    --   function()
    --     require("diffview.config").actions.select_prev_entry()
    --   end,
    -- },
    -- {
    --
    --   "<c-n>",
    --   function()
    --     require("diffview.config").actions.select_next_entry()
    --   end,
    -- },
  })
end
return M.Ftplugin()
