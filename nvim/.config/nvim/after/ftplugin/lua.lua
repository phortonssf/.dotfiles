vim.opt_local.path:append("~/.dotfiles/nvim/.config/nvim/lua")
vim.opt_local.suffixesadd:prepend(".lua")
vim.opt_local.suffixesadd:prepend("init.lua")
vim.opt_local.path:prepend(vim.fn.stdpath("config") .. "/lua")
