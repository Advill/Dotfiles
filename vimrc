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
colorscheme noctu

"line highlighting
set cursorline 
"set line to be highlighted instead of underline, color 236 seems to work
hi cursorline cterm=NONE ctermbg=236

"setting tab amounts
set tabstop=2
set shiftwidth=2
set softtabstop =2
set expandtab
set smarttab

"set for specific filetypes
autocmd filetype ruby setlocal ts=2 sw=2 sts=2 expandtab
autocmd filetype python setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype haskell setlocal ts=2 sw=2 sts=2 expandtab

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

set hidden " allow buffer switching without saving
set showtabline=2 "alswas show tabline

" change highlighting for diff and git
highlight DiffAdd     cterm=bold ctermfg=10
highlight DiffDelete  cterm=bold ctermfg=1
highlight DiffChange  cterm=bold ctermfg=3

" Start statusline
set laststatus=2
let g:lightline = {
  \ 'tabline': {
  \   'left': [ [ 'bufferinfo' ],
  \             [ 'separator' ],
  \             [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
  \   'right': [ [ 'close' ], ],
  \ },
  \ 'component_expand': {
  \   'buffercurrent': 'lightline#buffer#buffercurrent',
  \   'bufferbefore': 'lightline#buffer#bufferbefore',
  \   'bufferafter': 'lightline#buffer#bufferafter',
  \ },
  \ 'component_type': {
  \   'buffercurrent': 'tabsel',
  \   'bufferbefore': 'raw',
  \   'bufferafter': 'raw',
  \ },
  \ 'component_function': {
  \   'bufferinfo': 'lightline#buffer#bufferinfo',
  \ },
  \ 'component': {
  \   'separator': '',
  \ },
  \ }

"remap arrow keys
noremap <Left> :bprev<CR>
noremap <Right> :bnext<CR>


