
require("bufferline").setup{
 options = {
       numbers = function(opts)
      return opts.ordinal
    end,
     diagnostics = "nvim_lsp",
     separator_style = "thin",
  right_mouse_command = 'vert sbuffer %d',
  }

}
