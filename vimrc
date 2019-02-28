"pathogen
execute pathogen#infect()
"call pathogen#helptags()

"NERDTree specirfics:
map <C-n> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr ("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"setting the status line for 
set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"
"enabling sytnatx highlighting
syn on
"colorscheme
colorscheme default
"line highlighting
set cursorline 
"set line to be highlighted instead of underline, color 18 seems to work
hi cursorline cterm=NONE ctermbg=236

"set for specific filetypes
autocmd Filetype ruby setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype haskell setlocal ts=2 sw=2 sts=2 expandtab

"setting tab amounts
set tabstop=2
set softtabstop=0
set expandtab
set shiftwidth=2
set smarttab

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

"column
set colorcolumn=81
highlight colorcolumn ctermbg=4

"better movement between panes
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"case insensitve searching
:set ignorecase
:set smartcase "if contains uppercase, do case sensitve

" change highlighting for diff and git
highlight DiffAdd     cterm=bold ctermfg=10
highlight DiffDelete  cterm=bold ctermfg=1
highlight DiffChange  cterm=bold ctermfg=3

" Start statusline
set laststatus=2
