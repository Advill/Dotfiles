"pathogen
execute pathogen#infect()
"call pathogen#helptags()

"NERDTree specifics:
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" If opened to a directory, open nerdtree instead of the vim directory viewer
autocmd bufenter * if (winnr ("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"setting the status line
set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"
"enabling sytnatx highlighting
syn on

"colorscheme - most of this is gruvbox-specific
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_sign_column = 'bg0'
" Improved strings, useful but keeping regular for now
" let g:gruvbox_improved_strings = 1
let g:gruvbox_color_column = 'blue'
colorscheme gruvbox
" vim ignores terminal-set colors
set termguicolors

" scroll padding
set scrolloff=15 "keep 15 lines below and above cursor

"line highlighting
set cursorline 
"set line to be highlighted instead of underline
hi cursorline cterm=NONE ctermbg=18

"Markdown spell checking
autocmd filetype markdown setlocal spell spelllang=en_us

"setting tab amounts, default is 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop =2
set expandtab
set smarttab
set eol

"set for specific filetypes
" 2 spaces
autocmd filetype ruby setlocal ts=2 sw=2 sts=2 expandtab
autocmd filetype python setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype haskell setlocal ts=2 sw=2 sts=2 expandtab
" Make requires tabs, C looks better with them
autocmd Filetype c setlocal ts=4 sw=4 noexpandtab
autocmd Filetype make setlocal ts=4 sw=4 noexpandtab

" filetypes vim doesnt know can be forced to use a certain syntax
autocmd BufNewFile,BufRead *.svelte set syntax=html

set number "line numbers
filetype indent on "load filetype-specific indentations.
set lazyredraw "only redraw when needed, saves some battery
set showmatch "match () [] {}, highlight opposite of these symbols

"set fast cursor movement
set ttyfast

"highlighting search matches
set hlsearch
" search as characters are entered
set incsearch

" graphical menu of file results
set wildmenu

"column
set colorcolumn=81

"better movement between panes
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"case insensitve searching
set ignorecase
set smartcase "if contains uppercase, do case sensitve

set hidden " allow buffer switching without saving

"remap arrow keys
noremap <Left> :bprev<CR>
noremap <Right> :bnext<CR>

set ttimeoutlen=10 " Time in milliseconds to wait for a key code sequence to
" complete
set noshowmode " Dont show current mode

" youcompleteme options
let g:ycm_global_ycm_extra_conf = '~/Documents/classes/networking/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1

" Neovim specific configurations
if has('nvim')
  set laststatus=0 ruler
endif
