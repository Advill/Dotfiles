"setting the status line for 
set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"
"enabling sytnatx highlighting
syn on

"setting tab amounts
"set tabstop=2 "from a read file
set softtabstop=4 "when writing a file
set shiftwidth=4 "for c
set expandtab "tabs are spaces

set number "line numbers
filetype indent on "load filetype-specific indentations.
set wildmenu "command auto-completeion YOU MAY HATE THIS
set lazyredraw "only redraw when needed
set showmatch "match () [] {}

"set fast cursor movement
set ttyfast

"highlighting search matches
set hlsearch

"column
set colorcolumn=80
highlight colorcolumn ctermbg=4
"pathogen
execute pathogen#infect()
call pathogen#helptags()
