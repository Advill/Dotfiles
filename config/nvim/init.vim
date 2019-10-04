"pathogen
execute pathogen#infect()
"call pathogen#helptags()

"NERDTree specirfics:
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

autocmd bufenter * if (winnr ("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"setting the status line for 
set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"
"enabling sytnatx highlighting
syn on

"colorscheme
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_sign_column = 'bg0'
" Improved strings, useful but keeping regular for now
" let g:gruvbox_improved_strings = 1
let g:gruvbox_color_column = 'blue'
colorscheme gruvbox
set termguicolors

" scroll padding
set scrolloff=15 "keep 10 lines below and above cursor

"line highlighting
set cursorline 
"set line to be highlighted instead of underline, color 236 seems to work
"hi cursorline cterm=NONE ctermbg=236
hi cursorline cterm=NONE ctermbg=18

"Markdown spell checking
autocmd filetype markdown setlocal spell spelllang=en_us

"setting tab amounts
set tabstop=2
set shiftwidth=2
set softtabstop =2
set expandtab
set smarttab
set eol

"set for specific filetypes
autocmd filetype ruby setlocal ts=2 sw=2 sts=2 expandtab
autocmd filetype python setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype haskell setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype c setlocal ts=4 sw=4 noexpandtab
autocmd Filetype make setlocal ts=4 sw=4 noexpandtab

autocmd BufNewFile,BufRead *.svelte set syntax=html

set number "line numbers
filetype indent on "load filetype-specific indentations.
set lazyredraw "only redraw when needed
set showmatch "match () [] {}

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
"highlight colorcolumn ctermbg=4

"better movement between panes
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"case insensitve searching
set ignorecase
set smartcase "if contains uppercase, do case sensitve

set hidden " allow buffer switching without saving
"set showtabline=2 "alswas show tabline

" change highlighting for diff and git
"highlight DiffAdd     cterm=bold ctermfg=10
"highlight DiffDelete  cterm=bold ctermfg=1
"highlight DiffChange  cterm=bold ctermfg=3

"remap arrow keys
noremap <Left> :bprev<CR>
noremap <Right> :bnext<CR>

set ttimeoutlen=10
set noshowmode

" ycm options
let g:ycm_global_ycm_extra_conf = '~/Documents/classes/networking/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1

" folding
"set foldmethod=indent
"set foldlevel=1
"set foldclose=all
"set foldnestmax=2

" Neovim specific configurations
if has('nvim')
  set laststatus=0 ruler
endif
