-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
--
-- vim.api.nvim_create_autocmd("TextYankPost", {
--   group = augroup("numberline"),
--   callback = function()
--     vim.highlight.on_yank()
--   end,
-- })
---- this is to fix bug: https://github.com/folke/which-key.nvim/issues/476
-- vim.api.nvim_create_autocmd("FileType", {
--   desc = "Set up neorg Which-Key descriptions",
--   group = vim.api.nvim_create_augroup("neorg_mapping_descriptions", { clear = true }),
--   pattern = "fugitive",
--   callback = function()
--     vim.keymap.set("n", "<localleader>", function()
--       require("which-key").show(",")
--     end, { buffer = true })
--   end,
-- })
--
--
-- Autocommand to bind keys when Trouble window is opened
-- vim.api.nvim_create_autocmd("BufWinEnter", {
--   group = "TroubleKeybinds",
--   callback = function()
--     local bufnr = vim.api.nvim_get_current_buf()
--     if is_trouble_buffer(bufnr) then
--       vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-n>", ":cnext<CR>", { noremap = true, silent = true })
--       vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-p>", ":cprev<CR>", { noremap = true, silent = true })
--     end
--   end,
-- })
--
-- delete  diffy
-- vim.api.nvim_create_augroup("FugitiveDiffview", { clear = true })
-- vim.api.nvim_create_autocmd("FileType", {
--   group = "FugitiveDiffview",
--   pattern = "fugitive",
--   callback = function()
--     -- Keybinding to accept the right side of the conflict
--     vim.api.nvim_buf_set_keymap(0, "n", "<leader>gr", ":diffget //3<CR>", { noremap = true, silent = true })
--   end,
-- })
vim.api.nvim_create_autocmd("User", {
  pattern = "FugitiveIndex",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "n", "dt", ":Gtabedit <Plug><cfile><Bar>Gdiffsplit<CR>", {
      noremap = false,
      silent = true,
    })
  end,
})
