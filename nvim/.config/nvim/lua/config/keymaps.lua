--sdfkkkj Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local wk = require("which-key")
wk.add({
  {
    "<leader>ww",
    function()
      vim.cmd("wincmd p")
    end,
    desc = "prev window",
  },
  -- { "<leader>gG", hidden = true },
  -- { "<leader>gg", hidden = true },
  { "<leader>O", hidden = true },
  { "<leader>p", hidden = true },
  { "<leader>P", hidden = true },
  { "<leader>b", hidden = true },
  -- ["<leader>p"] = "which_key_ignore",
  -- ["<leader>P"] = "which_key_ignore",
  -- ["<leader>d"] = "which_key_ignore",
  -- ["j"] = "which_key_ignore",
  -- ["<leader>`"] = "which_key_ignore",
})
local keymap = vim.api.nvim_set_keymap
local opt = {
  noremap = true,
  silent = true,
}
--backspace as another leader
keymap("n", "<bs>", "<space>", { noremap = false })
-- vim.keymap.set("n", "<localleader>", '<cmd>lua require("which-key").show("\\\\")<cr>')
--remove binds
vim.keymap.del("n", "<c-_>")
vim.keymap.set("v", "u", "<esc>", { noremap = true, silent = true })
keymap("n", "<c-w>r", "<cmd>vs#<cr>", { desc = "reopen window" })

--esc
keymap("i", "jk", "<esc>", {})

keymap("i", "jj", "<esc>", {})
-- vim.keymap.del("n", "<c-/")
keymap("i", "<f8>", "<cmd> echo 'insert help '<cr>", {})
keymap("n", "<f8>", "<cmd> echo 'normal help'<cr>", {})
-- delete to black hole
keymap("v", "<c-_>", "gcc", {})
keymap("n", "<c-_>", "gcc", {})
keymap("n", "d", '"_d', opt)
keymap("v", "d", '"_d', opt)
keymap("n", "d", '"_d', opt)
keymap("n", "c", '"_c', opt)
keymap("v", "c", '"_c', opt)
keymap("n", "c", '"_c', opt)
keymap("n", "x", '"_x', opt)

keymap("n", "H", "^", opt)
keymap("n", "L", "$", opt) --yank end of line
keymap("n", "Y", "y$", opt)
-- greatest remap ever paste delete visual
keymap("x", "p", [["_dP]], {})
keymap("n", "<leader>p", "o<esc>p", { desc = "paste below line" })
keymap("n", "<leader>P", "ko<esc>p", { desc = "paste above line" })
--cut
keymap("v", "<leader>d", '"+d', opt)
keymap("n", "<leader>dd", "yydd", opt)
keymap("n", "<leader>d", '"+d', opt)
keymap("n", "vp", "`[v`]", { desc = "highlight last paste", noremap = true, silent = true })
-- visual end of line
keymap("n", "V", "v$", opt)
keymap("n", "vv", "V", opt)
-- Prime binds center on scroll"
keymap("n", "n", "nzzzv", opt)
keymap("n", "N", "Nzzzv", opt)
keymap("n", "gg", "ggzz", opt)
keymap("n", "G", "Gzz", opt)
--newline
keymap("n", "<leader>O", "O<esc>", opt)
-- keymap("n", "<C-x>", ":bp<Bar>bd #<Cr>", opt)
-- keymap("J", "mzJ`z", opt)
--delete matching paren, curly
keymap("n", "<leader>d%", ":norm %x`'x<cr>", opt)
--harpoon
keymap("n", "<c-j>", ":lua require('harpoon.ui').nav_file(1)<cr>", opt)
keymap("n", "<c-k>", ":lua require('harpoon.ui').nav_file(2)<cr>", opt)
keymap("n", "<c-l>", ":lua require('harpoon.ui').nav_file(3)<cr>", opt)
keymap("n", "F13", ":lua require('harpoon.ui').nav_file(4)<CR>", opt)
-- ctrl-; is f13 kinesis bind
keymap("n", "<F13>", ":lua require('harpoon.ui').nav_file(4)<CR>", opt)
keymap("n", "<C-e>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opt)
keymap("n", "<leader>m", ":lua require('harpoon.mark').toggle_file()<CR>", { desc = "Harpoon Mark" })
--Undo to Last Write
keymap(
  "n",
  "<leader>U",
  ":ea 1f<CR>  | :echo 'Undo until last write'<CR>",
  { desc = "undo to write", noremap = true, silent = true }
)
keymap("n", "Q", "@q", { desc = "Macro" })
--keymap"n", "<A-g>", "<cmd> !$EDITOR | "
-- move visual selection left/right
keymap("n", "<", "<gv", opt)
keymap("v", "<", "<gv", opt)
keymap("n", ">", ">gv", opt)
keymap("v", ">", ">gv", opt)

-- GOT TO PREV WINDOW AFTER FLASH
_G.current_window_id = nil

-- keybinding to get and print the current window id
vim.keymap.set("n", "s", function()
  _G.previous_window_id = vim.api.nvim_get_current_win()
  -- print(_G.previous_window_id)
  require("flash").jump()
end, { noremap = true, silent = true })

-- Function to go to the saved window ID
local function go_to_saved_window()
  if _G.previous_window_id then
    vim.api.nvim_set_current_win(_G.previous_window_id)
  else
    print("No window ID saved")
  end
end
-- Keybinding to go to the saved window ID
vim.keymap.set("n", "<leader>^", go_to_saved_window, { desc = "flash return", noremap = true, silent = true })
vim.keymap.set("n", "<leader><Tab>q", "<cmd> tabclose <cr>", { desc = "Tab Close", noremap = true, silent = true })

-- vim.keymap.set("n", "<c-w><c-w>", "<c-w><c-p>")
function ToggleQuickFix()
  local quickfix_open = false
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      quickfix_open = true
      break
    end
  end

  if quickfix_open then
    vim.cmd("cclose")
  else
    vim.cmd("copen")
  end
end

vim.keymap.set("n", "<leader>xq", ToggleQuickFix, { desc = "togglle quickfix_open" })

-- Function to check if the quickfix window is open
local function is_quickfix_open()
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      return true
    end
  end
  return false
end

-- Function to navigate to the next quickfix item if the quickfix window is open
local function next_quickfix_item()
  if is_quickfix_open() then
    vim.cmd("cnext")
  else
    print("Quickfix window is not open")
  end
end

-- Set the key binding
-- require("trouble").next(opts)
local function toggle_quickfix()
  local quickfix_open = false
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      quickfix_open = true
      break
    end
  end

  if quickfix_open then
    vim.cmd("cclose")
  else
    vim.cmd("copen")
  end
end

local function print_table(t, indent)
  indent = indent or 0
  local indent_str = string.rep("  ", indent)

  for key, value in pairs(t) do
    if type(value) == "table" then
      print(indent_str .. tostring(key) .. ":")
      print_table(value, indent + 1)
    else
      print(indent_str .. tostring(key) .. ": " .. tostring(value))
    end
  end
end

-- Function to get the visual selection
local function get_visual_selection()
  vim.cmd('noau normal! "vy"')
  return vim.fn.getreg("v")
end

-- Function to escape special characters in the search string
local function escape_string(str)
  return vim.fn.escape(str, "\\/.*$^~[]")
end

-- Function to search and replace
local function search_replace()
  local mode = vim.api.nvim_get_mode().mode
  local search_term

  if mode == "v" then
    search_term = get_visual_selection()
  else
    search_term = vim.fn.expand("<cword>")
  end

  search_term = escape_string(search_term)
  local replace_term = vim.fn.input("Replace with: ")

  vim.cmd(":%s/" .. search_term .. "/" .. replace_term .. "/gc")
end
--Search
vim.keymap.set("n", "<leader>sr", search_replace, { desc = "search and replace", noremap = true, silent = true })
vim.keymap.set("v", "<leader>sr", search_replace, { desc = "search and replace", noremap = true, silent = true })

local function mark_long_jumps(key)
  return function()
    local count = vim.v.count1 -- Use count1 to default to 1 if no count is given
    if count > 10 then
      vim.cmd("normal! m'")
    end
    vim.cmd("normal! " .. count .. key)
  end
end

-- add marks to long movements
vim.keymap.set("n", "j", mark_long_jumps("j"), { noremap = true, silent = true })
vim.keymap.set("n", "k", mark_long_jumps("k"), { noremap = true, silent = true })

-- GIT
local function reset_current_buffer()
  require("gitsigns").reset_buffer()
end

-- Set the keybinding to reset the current buffer
vim.api.nvim_set_keymap("n", "<leader>gr", "", {
  desc = "reset file",
  noremap = true,
  silent = true,
  callback = reset_current_buffer,
})
local function trouble_next()
  local isOpen = require("trouble").is_open(opts)
  if isOpen == true then
    require("trouble").next({ jump = true })
  else
  end
end
local function trouble_prev()
  local isOpen = require("trouble").is_open(opts)
  if isOpen == true then
    require("trouble").prev({ jump = true })
  else
  end
end

vim.keymap.set("n", "<c-n>", trouble_next, { noremap = true, silent = true })
vim.keymap.set("n", "<c-p>", trouble_prev, { noremap = true, silent = true })

-- keymap("n", "<leader>gd", "<cmd> DiffviewFileHistory % <cr>", { desc = "Diff File" })
-- keymap("n", "<leader>gD", "<cmd> DiffviewFileHistory <cr>", { desc = "Diff Branch" })
keymap("n", "<leader>gs", "<cmd>to vert G<cr>", { silent = true, desc = "Fugitive", noremap = true })
keymap("n", "<leader>gc", "<cmd>G commit<cr>", opt)
local function diffOpenWithInput()
  local user_input = vim.fn.input("Revision to Open: ")
  vim.cmd("DiffviewOpen " .. user_input)
end

local function diffOpenFileHistory()
  local user_input = vim.fn.input("Files to Open: ")
  vim.cmd("DiffviewFileHistory" .. user_input)
end

-- Key maps
require("which-key").add({
  { "<leader>g", group = "Git" },
  { "<leader>gf", diffOpenFileHistory, desc = "Open DiffView on Files" },
  { "<leader>go", diffOpenWithInput, desc = "Open DiffView" },
})
