local M = { "gbprod/yanky.nvim" }
M.config = function()
	local mapping = require("yanky.telescope.mapping")
	local utils = require("yanky.utils")
	require("yanky").setup({
		ring = {
			history_length = 100,
			-- storage = "memory",
			sync_with_numbered_registers = true,
		},
		system_clipboard = {
			sync_with_ring = true,
		},
		picker = {
			telescope = {
				mappings = {
					default = mapping.put("p"),
					i = {
						["<c-g>"] = mapping.put("p"),
						["<c-k>"] = mapping.put("P"),
						["<c-x>"] = mapping.delete(),
						["<c-r>"] = mapping.set_register(utils.get_default_register()),
					},
					n = {
						["dd"] = mapping.delete(),
						p = mapping.put("p"),
						["<c-r>"] = mapping.set_register(utils.get_default_register()),
						P = mapping.put("P"),
						d = mapping.delete(),
						r = mapping.set_register(utils.get_default_register()),
					},
				},
			},
		},
	})
	vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
	vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")
	vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
	vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
	vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
	vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")
	vim.keymap.set({ "n" }, "<c-y>", "<cmd>YankyRingHistory<CR>", { desc = "Yanky History" })
end
return M
