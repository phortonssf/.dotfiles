local keymap = {
   mode = { norm = "n", vis = "v", cmd = "c", ins = "i"},
   core = {
  {mode = "", keymap = "", cmd = "", desc = ""}
  }
}
  -- "{mode = {}, keybind = "", " command = {}, desc= "", exit_mode}
-- vim.keymap.set({"n","v","x"}, "noremap <C-_> :Commentary <CR>", {desc = "comment line with ctrl-/"})
-- print ( keymap.mode.norm )
-- vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", {desc = "search and replace word under cursor"})
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>",{desc = 'tmux new session'})
-- vim.keymap.set("n", "<leader>k", "<cmd>cnext<CR>zz",{desc = "quickfix next in list"})
-- vim.keymap.set("n", "<leader>j", "<cmd>cnext<CR>zz",{desc = "quickfix next in list"})

vim.keymap.set("n","<c-_>","  :commentary <cr>")
vim.keymap.set("x","<c-_>","  :commentary <cr>")
vim.keymap.set("i", "jj", "<esc>")
vim.keymap.set("i", "kk", "<Esc>")
vim.keymap.set("n", "<C-q>", "<esc> :qa <CR>")
-- vim.keymap.set("n", "<Ctrl-/", "<esc>")
-- vim.g.mapleader = ""
-- vim.keymap.set("n", "<leader>db", ":lua require('digitaldive.utils.diff')()<CR>", {desc = "Diff With"})
-- vim.keymap.set(keymap.mode.norm, "noremap <C-_>", ":Commentary <CR>", {desc = "comment line with ctrl-/"})
-- -- vim.api.nvim_get_keymap('n'vim)
-- vim.keymap.set("n", "<leader>gcl", ":Ggrep '^<<<<<<<'<CR>", {desc = "Find all merge conflicts "})
-- vim.keymap.set("n", "<leader>hw", ':help expand("<cword>"<cr>')
-- -- vim.keymap.set("n", "<leader>hw ", :help <C-r><C-w><CR>
-- vim.keymap.set("n", "]q", ":cnext<CR>", {desc = "QuickFix Next"})
-- vim.keymap.set("n", "[q", ":cprev<CR>", {desc = "QuickFix Next"})
-- vim.keymap.set("n", "<Up>", ":cprev<CR>", {desc = "QuickFix Next"})
-- vim.keymap.set("n", "<Down>", ":cnext<CR>", {desc = "QuickFix Next"})
-- vim.keymap.set("n", "<leader>tt", function() print("hello") end)
-- vim.keymap.set('n', '<leader>q', function()
--   local qf_winid = vim.fn.getqflist({ winid = 0 }).winid
--   -- print(qf_winid)
--   local action = qf_winid > 0 and 'cclose' or "ccopen"
--   if ( action == "ccopen" )
--   then
--     vim.diagnostic.setqflist()
--   else
--     vim.cmd('cclose')
--   end
-- end)
