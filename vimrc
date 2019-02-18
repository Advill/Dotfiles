"setting the status line for 
set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"
"enabling sytnatx highlighting
syn on

"set for specific filetypes
autocmd Filetype ruby setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype haskell setlocal ts=2 sw=2 sts=2 expandtab

"colorscheme
colorscheme default

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

"column
set colorcolumn=81
highlight colorcolumn ctermbg=4

"case insensitve searching
:set ignorecase
:set smartcase "if contains uppercase, do case sensitve

"pathogen
"execute pathogen#infect()
"call pathogen#helptags()
