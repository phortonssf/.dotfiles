local M = {}
-- function Mj.setup() end
-- vim.g.maplocalleader = "\\"
-- vim.keymap.set("n", "<localleader>", function()
--   require("which-key").show("\\")
-- end, { buffer = true })
-- local wk = require("which-key")
-- M.wkopts = {
--   mode = "n", -- NORMAL mode
--   silent = true,
--   noremap = false,
--   nowait = false,
-- }
--
-- function M.whichkey(maps, opts)
--   if opts == nil then
--     opts = {}
--   end
--   wk.add(maps, vim.tbl_extend("keep", opts, M.wkopts))
-- end
--
-- function M.localleader(maps, opts)
--   if opts == nil then
--     opts = {}
--   end
--
--   M.whichkey(
--     maps,
--     vim.tbl_extend("keep", opts, {
--       prefix = "<localleader>",
--       buffer = 0,
--     })
--   )
-- end
-- function M.FtpluginTEST()
--   -- -- mappings.buf(0, "n", "p", "<cmd>Git push<CR>", { noremap = true })
--   --
--   --
--   --
--   --
--   --
--   -- czz                     Push stash.  Pass a [count] of 1 to add
--   --                         `--include-untracked` or 2 to add `--all`.
--   --
--   -- czw                     Push stash of worktree.  Like `czz` with
--   --                         `--keep-index`.
--   --
--   -- czA                     Apply topmost stash, or stash@{count}.
--   --
--   -- cza                     Apply topmost stash, or stash@{count}, preserving the
--   --                         index.
--   --
--   -- czP                     Pop topmost stash, or stash@{count}.
--   --
--   -- czp                     Pop topmost stash, or stash@{count}, preserving the
--   --                         index.
--   --
--   -- cz<Space>               Populate command line with ":Git stash ".
--
--   M.localleader({
--     s = { "s", "stage" },
--     u = { "u", "unstage" },
--     ["-"] = { "-", "Toggle Stage" },
--     U = { "U", "Unstage all" },
--     X = { "X", "Discard" },
--     -- [","] = { "=", "Toggle diff" },
--     ["="] = { "=", "Toggle diff" },
--     -- [">"] = { ">", "Show diff" },
--     -- ["<"] = { "<", "Hide diff" },
--     -- I = { "I", "Add Patch" },
--     d = { name = "Diffs" },
--     dd = { "dd", "Gdiffsplit" },
--     dv = { "dv", "Gvdiffsplit" },
--     ds = { "ds", "Ghdiffsplit" },
--     dq = { "dq", "Close Diffs" },
--     ["<CR>"] = { "<CR>", "Open" },
--     o = { "O", "Open vsplit" },
--     gO = { "o", "Open split" },
--     O = { "O", "Open tab" },
--     P = { "1p", "Open preview" },
--     p = { "<cmd>Git push<cr>", "Push" },
--     C = { "C", "Open commit" },
--     -- ["("] = { "(", "Jump prev" },
--     -- [")"] = { ")", "Jump next" },
--     i = { "i", "Next file (expand)" },
--     -- ["*"] = { "*", "Find +/-" },
--     I = { "1gi", "Open .gitignore" },
--     gI = { "1gI", "Add to ignore" },
--     c = { name = "Commits" },
--     cc = { "cvc", "Create commit" },
--     ca = { "cva", "Amend" },
--     ce = { "ce", "Amend noedit" },
--     cw = { "cw", "Reword" },
--     -- cvc = { "cvc", "Commit -v" },
--     -- cva = { "cva", "Amend -v" },
--     cf = { "cf", "Fixup" },
--     cF = { "cF", "Fixup+Rebase" },
--     cs = { "cs", "Squash" },
--     cS = { "cS", "Squash+Rebase" },
--     cA = { "cA", "Squash+Edit" },
--     ["c<space>"] = { "c<space>", ":Git commit ..." },
--     cr = { name = "Revert" },
--     crc = { "crc", "Revert" },
--     crn = { "crn", "Revert (nocommit)" },
--     ["cr<space>"] = { "cr<space>", ":Git revert ..." },
--     ["cm<space>"] = { "cm<space>", ":Git merge ..." },
--     co = { name = "Checkout" },
--     coo = { "coo", "Checkout Commit" },
--     ["cb<space>"] = { "cb<space>", ":Git branch ..." },
--     ["co<space>"] = { "co<space>", ":Git checkout ..." },
--     cz = { name = "Stashes" },
--     czz = { "czz", "Push stash" },
--     czZ = { "1czz", "Push stash untracked" },
--     -- czA = { "2czz", "Push stash all" },
--     czw = { "czw", "Push stash worktree" },
--     czA = { "czA", "Apply stash" },
--     cza = { "cza", "Apply stash preserve" },
--     czP = { "czP", "Pop stash" },
--     czp = { "czp", "Pop stash preserve" },
--     ["cz<space>"] = { "co<space>", ":Git stash ..." },
--     -- TODO: Rebase
--     r = { name = "Rebase" },
--     ri = { "ri", "Interactive" },
--     rf = { "rf", "Interactive notodo" },
--     ru = { "ru", "Against @{upstream}" },
--     rp = { "rp", "Against @{push}" },
--     rr = { "rr", "Continue" },
--     rs = { "rs", "Skip" },
--     ra = { "ra", "Abort" },
--     re = { "re", "Edit todo" },
--     rw = { "rw", "commit: reword" },
--     rm = { "rm", "commit: edit" },
--     rd = { "rd", "commit: drop" },
--     ["r<Space>"] = { "r<Space>", ":Git rebase ... " },
--     q = { "gq", "Close status" },
--   })
--   wk.add({
--     ["[g"] = { "[c", "Prev hunk" },
--     ["]g"] = { "]c", "Next hunk" },
--     ["[m"] = { "[m", "Prev file" },
--     ["]m"] = { "]m", "Next file" },
--     gq = { "gq", "Close status" },
--     ["<ESC>"] = { "gq", "Close status" },
--   }, {
--     buffer = 0,
--   })

-- vim.cmd([[
-- augroup _fugitive
--   autocmd! * <buffer>
--   autocmd CursorHold,CursorHoldI <buffer> lua require'which-key'.show()
-- augroup END
-- ]])
-- end

function M.Ftplugin()
  require("which-key").add({
    { "<2-LeftMouse>", hidden = true },
    { "a", hidden = true }, -- hide this keymap
    { "C", hidden = true }, -- hide this keymap
    { "ca", hidden = true }, -- hide this keymap
    { "cA", hidden = true }, -- hide this keymap
    { "cc", hidden = true }, -- hide this keymap
    { "cf", hidden = true }, -- hide this keymap
    { "cF", hidden = true }, -- hide this keymap
    { "ce", hidden = true }, -- hide this keymap
    { "cmt", hidden = true }, -- hide this keymap
    { "coo", hidden = true }, -- hide this keymap
    { "cRe", hidden = true }, -- hide this keymap
    { "cRa", hidden = true }, -- hide this keymap
    { "crc", hidden = true }, -- hide this keymap
    { "crc", hidden = true }, -- hide this keymap
    { "crn", hidden = true }, -- hide this keymap
    { "cRw", hidden = true }, -- hide this keymap
    { "cS", hidden = true }, -- hide this keymap
    { "cs", hidden = true }, -- hide this keymap
    { "cs", hidden = true }, -- hide this keymap
    { "cva", hidden = true }, -- hide this keymap
    { "crn", hidden = true }, -- hide this keymap
    { "cva", hidden = true }, -- hide this keymap
    { "cvc", hidden = true }, -- hide this keymap
    { "cw", hidden = true }, -- hide this keymap
    { "cza", hidden = true }, -- hide this keymap
    { "czA", hidden = true }, -- hide this keymap
    { "czp", hidden = true }, -- hide this keymap
    { "czP", hidden = true }, -- hide this keymap
    { "czs", hidden = true }, -- hide this keymap
    { "czv", hidden = true }, -- hide this keymap
    { "czw", hidden = true }, -- hide this keymap
    { "czz", hidden = true }, -- hide this keymap
    { "D", hidden = true }, -- hide this keymap
    { "D", hidden = true }, -- hide this keymap
    { "dp", hidden = true }, -- hide this keymap
    { "dd", hidden = true }, -- hide this keymap
    { "dv", hidden = true }, -- hide this keymap
    { "ds", hidden = true }, -- hide this keymap
    { "dh", hidden = true }, -- hide this keymap
    { "dq", hidden = true }, -- hide this keymap
    { "gu", hidden = true }, -- hide this keymap
    { "gU", hidden = true }, -- hide this keymap
    { "gs", hidden = true }, -- hide this keymap
    { "gp", hidden = true }, -- hide this keymap
    { "gP", hidden = true }, -- hide this keymap
    { "gr", hidden = true }, -- hide this keymap
    { "gi", hidden = true }, -- hide this keymap
    { "gf", hidden = true }, -- hide this keymap
    { "gC", hidden = true }, -- hide this keymap
    { "gI", hidden = true }, -- hide this keymap
    { "gO", hidden = true }, -- hide this keymap
    { "gq", hidden = true }, -- hide this keymap
    { "ri", hidden = true }, -- hide this keymap
    { "ru", hidden = true }, -- hide this keymap
    { "rf", hidden = true }, -- hide this keymap
    { "ru", hidden = true }, -- hide this keymap
    { "rp", hidden = true }, -- hide this keymap
    { "rr", hidden = true }, -- hide this keymap
    { "rs", hidden = true }, -- hide this keymap
    { "ra", hidden = true }, -- hide this keymap
    { "re", hidden = true }, -- hide this keymap
    { "rw", hidden = true }, -- hide this keymap
    { "rm", hidden = true }, -- hide this keymap
    { "rd", hidden = true }, -- hide this keymap
    { "ra", hidden = true }, -- hide this keymap
    { "r<Space>", hidden = true }, -- hide this keymap

    { "i", hidden = true }, -- hide this keymap
    { "I", hidden = true }, -- hide this keymap
    { "J", hidden = true }, -- hide this keymap
    { "K", hidden = true }, -- hide this keymap
    -- { "M", hidden = true }, -- hide this keymap
    { "p", hidden = true }, -- hide this keymap
    { "P", hidden = true }, -- hide this keymap
    { "R", hidden = true }, -- hide this keymap
    { "rk", hidden = true }, -- hide this keymap
    { "rx", hidden = true }, -- hide this keymap
    { "#", hidden = true }, -- hide this keymap
    { "(", hidden = true }, -- hide this keymap
    { ")", hidden = true }, -- hide this keymap
    { "*", hidden = true }, -- hide this keymap
    { "-", hidden = true }, -- hide this keymap
    { ".", hidden = true }, -- hide this keymap
    { "<", hidden = true }, -- hide this keymap
    { "=", hidden = true }, -- hide this keymap
    { ">", hidden = true }, -- hide this keymap
    { "?", hidden = true }, -- hide this keymap
    { "[/", hidden = true }, -- hide this keymap
    { "[[", hidden = true }, -- hide this keymap
    { "[]", hidden = true }, -- hide this keymap
    { "[c", hidden = true }, -- hide this keymap
    { "[m", hidden = true }, -- hide this keymap
    -- { "\\gd", hidden = true }, -- hide this keymap
    -- { "\\H", hidden = true }, -- hide this keymap
    { "]/", hidden = true }, -- hide this keymap
    { "][", hidden = true }, -- hide this keymap
    { "]]", hidden = true }, -- hide this keymap
    { "]c", hidden = true }, -- hide this keymap
    { "]m", hidden = true }, -- hide this keymap
    { "c?", hidden = true }, -- hide this keymap
    { "cb?", hidden = true }, -- hide this keymap
    { "cr?", hidden = true }, -- hide this keymap
    { "cr<space>", hidden = true }, -- hide this keymap
    { "cv<CR>", hidden = true }, -- hide this keymap
    { "c<space>", hidden = true }, -- hide this keymap
    { "cz<space>", hidden = true }, -- hide this keymap
    { "cr<BS>", hidden = true }, -- hide this keymap
    { "cv<BS><cr>", hidden = true }, -- hide this keymap
    { "cz<CR>", hidden = true }, -- hide this keymap
    { "c<BS>", hidden = true }, -- hide this keymap
    { "c<cr>", hidden = true }, -- hide this keymap
    { "cb", hidden = true }, -- hide this keymap
    { "cr", hidden = true }, -- hide this keymap
    { "cb", hidden = true }, -- hide this keymap
    { "cz?", hidden = true }, -- hide this keymap
    { "cm", hidden = true }, -- hide this keymap
    { "cm", hidden = true }, -- hide this keymap
    { "cm", hidden = true }, -- hide this keymap
    { "co", hidden = true }, -- hide this keymap
    { "r<BS>", hidden = true }, -- hide this keymap
    { "<F1>", hidden = true }, -- hide this keymap
    { "~", hidden = true }, -- hide this keymap
    { "d?", hidden = true }, -- hide this keymap
    { "g?", hidden = true }, -- hide this keymap
    { "g|", hidden = true }, -- hide this keymap
    { "r?", hidden = true }, -- hide this keymap
    { "r<CR>", hidden = true }, -- hide this keymap
    { "<c-w>", hidden = true }, -- hide this keymap
    { "s", hidden = true }, -- hide this keymap
    { "gc", hidden = true }, -- hide this keymap
    { "<c-p>", hidden = true }, -- hide this keymap
    { "<c-n>", hidden = true }, -- hide this keymap
    -- MINE
    { "<CR>", hidden = true }, -- hide this keymap
    { "cp", hidden = true }, -- hide this keymap
    { "c", hidden = true }, -- hide this keymap
  })
  local bufnr = vim.api.nvim_get_current_buf()

  local bufMap = vim.api.nvim_buf_set_keymap
  -- Set a keymap for the current buffer
  bufMap(bufnr, "n", "?", ":h fugitive <CR>", { desc = "fugitive help", noremap = true, silent = true })

  bufMap(bufnr, "n", "<CR>", ":Gvsplit <cfile><CR>", { desc = "Fugivie Open", noremap = true, silent = true })
  bufMap(bufnr, "n", "<C-v>", ":Gvsplit <cfile><CR>", { desc = "Fugivie Open", noremap = true, silent = true })

  bufMap(bufnr, "n", "<localleader>", "", {
    callback = function()
      require("which-key").show({ global = false })
    end,
    desc = "show",
    noremap = true,
    silent = true,
  })
  bufMap(bufnr, "n", "<localleader>H", ":Gvsplit - <CR>", { desc = "Show Last Message", noremap = true, silent = true })
  -- bufMap(
  --   bufnr,
  --   "n",
  --   "<localleader>gd",
  --   ":Gtabedit <cfile> | DiffviewFileHistory % <CR>",
  --   -- ":Gtabedit <cfile> <CR>",
  --   { desc = "Diffview File", noremap = true, silent = true }
  -- )
  -- bufMap(
  local feedkeys = vim.api.nvim_feedkeys
  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  -- Send 'iHello<Esc>' to enter insert mode, type 'Hello', and then exit insert mode
  -- feedkeys(t("iHello<Esc>"), "n", true)
  local wk = require("which-key")
  wk.add({
    {
      buffer = bufnr,
      "<Tab>",
      function()
        feedkeys(t("="), "n", true)
      end,
      desc = "Inline Diff",
      -- proxy = "=",
    },

    {
      buffer = bufnr,
      "X",
      -- ":Gtabedit <cfile> <CR>",
      desc = "Reset File",
    },

    {
      buffer = bufnr,
      "U",
      -- ":Gtabedit <cfile> <CR>",
      desc = "Unstage All Files",
    },
    {
      buffer = bufnr,
      "u",
      -- ":Gtabedit <cfile> <CR>",
      desc = "Unstage File",
    },

    {
      buffer = bufnr,
      "s",
      -- ":Gtabedit <cfile> <CR>",
      desc = "Stage File",
    },

    {
      buffer = bufnr,
      "gd",
      ":Gvsplit <cfile> | DiffviewFileHistory % <CR>",
      -- ":Gtabedit <cfile> <CR>",
      desc = "Diffview File",
    },
    {
      buffer = bufnr,
      "<leader>gd",
      ":Gvsplit <cfile> | DiffviewFileHistory % <CR>",
      -- ":Gtabedit <cfile> <CR>",
      desc = "Diffview File",
    },
  })
end
return M.Ftplugin()
