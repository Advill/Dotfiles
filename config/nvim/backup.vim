call plug#begin()
  Plug 'tpope/vim-surround'
  Plug 'Raimondi/delimitMate'
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'bling/vim-bufferline'
  Plug 'airblade/vim-gitgutter'
  Plug 'petertriho/nvim-scrollbar'
  Plug 'gruvbox-community/gruvbox'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'sudormrfbin/cheatsheet.nvim'
  Plug 'Yggdroot/indentLine'
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'neovim/nvim-lspconfig'
  Plug 'jose-elias-alvarez/null-ls.nvim'
  Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
call plug#end()

"NERDTree specifics:
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" If opened to a directory, open nerdtree instead of the vim directory viewer
autocmd bufenter * if (winnr ("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
set termguicolors
" colorscheme - most of this is gruvbox-specific
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_sign_column = 'bg0'
let g:gruvbox_color_column = 'blue'
let g:gruvbox_colors = {'dark0_hard': 'none'}
let g:gruvbox_italic = 1
let g:gruvbox_invert_selection = 0
let g:gruvbox_transparent_bg = 1
colorscheme gruvbox


"set bufferline
let g:bufferline_echo = 0
let g:bufferline_fname_mod = ':.'
"setting the status line
set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"
"enabling sytnatx highlighting
syn on

" scroll padding
set scrolloff=15 "keep 15 lines below and above cursor

"line highlighting
set cursorline 
"set line to be highlighted instead of underline
hi cursorline cterm=NONE ctermbg=Black
let g:indentLine_char = '|'

"Markdown spell checking
autocmd filetype markdown setlocal spell spelllang=en_us
autocmd filetype yaml setlocal ts=2 sts=2 sw=2 expandtab

"setting tab amounts, default is 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop =2
set expandtab
set smarttab
set eol
set list listchars=tab:»·,trail:·

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
let delimitMate_expand_cr=1
set hidden " allow buffer switching without saving

"remap arrow keys
noremap <Left> :bprev<CR>
noremap <Right> :bnext<CR>

"remap 

set ttimeoutlen=10 " Time in milliseconds to wait for a key code sequence to
" complete
set noshowmode " Dont show current mode

" youcompleteme options
let g:ycm_global_ycm_extra_conf = '~/Documents/classes/networking/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1

" Indentline turn off hiding `"` in json and whatever it does to markdown
let g:indentLine_concealcursor = ''
"let g:vim_json_conceal=0
"let g:markdown_json_conceal=0

" delimitmate
let g:delimitMate_expand_cr=1
let g:delimitMate_expand_space=1
let g:delimitMate_jump_expansion=1
let g:delimitMate_exluded_ft="vimrc"

" Neovim specific configurations
if has('nvim')
  set laststatus=0 ruler
  lua require("lsp-config")
endif
