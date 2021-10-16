syntax on
filetype plugin on


source ~/.sets.vim

if &term =~ '^xterm'
	" Cursor in terminal:
	" Link: https://vim.fandom.com/wiki/Configuring_the_cursor
	" 0 -> blinking block not working in wsl
	" 1 -> blinking block
	" 2 -> solid block
	" 3 -> blinking underscore
	" 4 -> solid underscore
	" Recent versions of xterm (282 or above) also support
	" 5 -> blinking vertical bar
	" 6 -> solid vertical bar

	" normal mode
	let &t_EI .= "\e[1 q" 	
	" insert mode
   let &t_EI .= "\e[1 q" 
	augroup windows_term
		autocmd!
		autocmd VimEnter * silent !echo -ne "\e[1 q" 
		autocmd VimLeave * silent !echo -ne "\e[5 q" 
	augroup END
endif

highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
highlight Cursor guifg=white guibg=black
highlight ColorColumn ctermbg=0 guibg=lightgrey

"******** AutoCMD ************
autocmd InsertEnter,InsertLeave * set cul!
autocmd VimLeave * silent !echo -ne "\e[6 q"

"Absolute numbers insert mode only
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

