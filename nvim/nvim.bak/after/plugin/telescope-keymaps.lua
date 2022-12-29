local builtin = require('telescope.builtin')
local live_grep_args = require('telescope').extensions.live_grep_args.live_grep_args
local map = vim.keymap.set
-- grep_open_files = true,
local ui = function(message, cb)
  vim.ui.input(
    {prompt = message },
    function(input)
      return cb({search = input,  additional_args = {"--hidden"}})
    end
  )
end
-- FILE SEARCHfS
-- vim.keymap.set(
--   "n",  "<leader>rf",
--   function ()
--    builtin.oldfiles({})
--   end
--   )
-- -- map('n', '<leader>tff', function () builtin.find_files({}) end, {desc = ""})
-- -- map("n",  "<leader>rf ", function () builtin.oldfiles() end, {desc = "Search Git Files"}),
-- -- map('n', '<leader>tff', function () builtin.find_files({ hidden=true, search_dirs = { "~/projects", "~/work", "~/.dotfiles/"}}) end, {desc = ""})
-- map('n', '<leader>pf', builtin.find_files, {desc = "Find files"})
-- map('n', '<C-p>', builtin.git_files, {})
-- -- SEARCH STRINGS
-- -- map("n", "<leader>ps", function () builtin.grep_string({ prompt_title = string.format("Search For (%s)", vim.loop.cwd()), hidden = true, search = vim.fn.input("Grep For > ")})end)
--
-- map('n', '<leader>ps', function()
-- 	builtin.grep_string({ search = vim.fn.input("Grep > ") });
-- end)
-- -- map('n', "<leader>pp", function()
-- --   ui("grep", builtin.grep_string)
-- -- end)
-- map("n", "<leader>trg", function ()
--   live_grep_args({
--   -- WIP remember last rg search
--     -- default_text = 'test',
--     -- on_complete = {
--     --   function(picker)
--     --     local mode = vim.fn.mode()
--     --     local keys = mode ~= "n" and "<ESC>" or ""
--     --     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys .. [[^v$<C-g>]], true, false, true), "n", true)
--     --     -- should you have more callbacks, just pop the first one
--     --     table.remove(picker._completion_callbacks, 1)
--     --   end,
--     -- }
--   })
-- end, {desc = "Rg search with opts"})
-- -- live grep
-- -- map('n', "<leader>ps",
-- --   function ()
-- --     ui('Grep for...', builtin.live_grep)
-- --   end
-- -- )
-- map("n","<Leader>T", ":Telescope<CR>")
-- map("n", "<leader>fd", "<cmd>Telescope dir live_grep<CR>", { noremap = true, silent = true })
-- map("n", "<leader>pd", "<cmd>Telescope dir find_files<CR>", { noremap = true, silent = true })
-- -- OTHER SEARCHES
-- map('n', '<leader>tr', function () builtin.resume() end, {desc = "Resume Last Search"})
-- map('n', '<leader>tch', function () builtin.command_history({}) end, {desc = "Search Command History"})
-- map("n",  "<leader>tp", " :lua require'telescope'.extensions.project.project{ display_type = 'full', hidden_files = true }<CR>")
-- map("n",  "<leader>Ex", " :Telescope file_browser <CR>")
-- map("n",  "<leader>tbg", " :lua require('telescope.builtin').live_grep({ prompt_title = 'find string in open buffers...', grep_open_files = true })<CR>")
-- map("n",  "<leader>tcp", " :Telescope command_palette <CR>")
--   -- map("n",  "<leader>vrc", function () builtin.search_dotfiles() end)
--   -- map("n",  "<leader>gb ", function () builtin.git_branches() end)
-- map("n",  "<leader>pw", function () builtin.grep_string({ prompt_title = string.format("Search (%s)", vim.loop.cwd()), search = vim.fn.expand("<cword>") }) end, {desc = "Grep word under cursor"})
-- map("n",  "<Leader>pf", function () builtin.grep_string { search = vim.fn.expand("<cword>"), hidden = true } end)
-- map("n",  "<leader>pb", function () builtin.buffers() end, {desc = "Search Current Buffers"})
-- map("n",  "<leader>vh", function () builtin.help_tags() end)
-- -- regex site
-- https://learnbyexample.github.io/vim_reference/Regular-Expressions.html
-- nnoremap <leader>skb :lua require("telescope.builtin").live_grep({search_dirs = {"~/.dotfiles/nvim/.config/nvim/plugin"}})<CR>

-- -- " search only key maps
-- WIP
-- -- " search only cached get repos in $HOME, update cache with updatedb, use locate
-- map("n", "<leader>gr", ":lua require'telescope'.extensions.repo.cached_list{file_ignore_patterns={'^'.. vim.env.HOME .. '/%.esy/','^'.. vim.env.HOME .. '/%.local/','^'.. vim.env.HOME .. '/%.nvm/','^'.. vim.env.HOME .. '/%.cache/', '^'.. vim.env.HOME .. '/%.config/','^'.. vim.env.HOME .. '/%.cargo/'}}<CR><CR>")
-- map("n", "leader>gr", ":Telescope repo cached_list <CR>")
-- map("n", "<leader>gr", ":lua require'telescope'.extensions.repo.cached_list{prompt_title = string.format('GIT REPO'), fd_opts = { '/home/digitaldive/projects'}}<CR>")

