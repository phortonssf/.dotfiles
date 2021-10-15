syntax on
set shell=/bin/zsh

set clipboard=unnamedplus


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

set guicursor+=i:block-Cursor-blinkon1-iCursor"
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue

highlight Cursor guifg=white guibg=black

" let &t_SI = "\<Esc>[12 h"
" let &t_SR = "\<Esc>[4 q"
" let &t_EI = "\<Esc>[2 q"
" autocmd InsertLeave * highlight  CursorLine ctermbg=Yellow ctermfg=None
" highlight Cursor guibg=#626262
" nnoremap <C-K> :call HighlightNearCursor()<CR>
" function HighlightNearCursor()
"   if !exists("s:highlightcursor")
"     match Todo /\k*\%#\k*/
"     let s:highlightcursor=1
"   else
"     match None
"     unlet s:highlightcursor
"   endif
" endfunction

"set show-mode-in-prompt on
"Search Settings
set incsearch
set nohlsearch
set hidden
set noerrorbells
set expandtab
set encoding=utf-8

" **** Line Numbers
"Line numbers relative
set relativenumber
"Current Line
set nu
set rnu
set signcolumn=yes
set nowrap
set cursorline

" Searching
set smartcase
set incsearch

" Caching buffers 
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Space setting
set list
set shiftround
set autoindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smartindent
set smarttab

"scroll before hitting bottom
set scrolloff=8

set ttimeoutlen=50


" first, enable status line always
set laststatus=2
set background=dark


" Format on paste
set pastetoggle=<F2>
set noshowmode
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

"******** AutoCMD ************
autocmd InsertEnter,InsertLeave * set cul!
autocmd VimLeave * silent !echo -ne "\e[6 q"
"*********  Key Remaps   ****************
" let mapleader="\<Space>"

"Leader + o to add space normal mode
nnoremap <leader>o o<esc>

" Alias for find all occurences *****
"nnoremap <leader>s :%s//gI<Left><Left><Left>
noremap <Leader>s :%s/\<<C-r><C-w>\>//gI<Left><Left><Left>
"source ~/.config/nvim/keymaps.vim

highlight ColorColumn ctermbg=0 guibg=lightgrey

filetype plugin on

"Absolute numbers insert mode only
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

