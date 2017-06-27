""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
" 	Khaldoon Sinjab
" 	https://www.sinjab.com/ - khaldoon@sinjab.com
" 
" Version:
" 	1.0 - 20/Jun/2017
" 
" Blog post:
" 	https://www.sinjab.com/blog
" 
" Sections:
" 	-> General
" 	-> User interface
" 	-> Appearance
" 	-> Tab and indent
" 	-> Text editing
" 	-> Status line
" 	-> Shortcut mappings
" 	-> Searching
" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MacVim clipboard
set clipboard=unnamed

" Remember 500 lines of : history
set history=500

" Detect file type and intend it accordingly
filetype plugin on
filetype indent on

" Reload files when changed outside
set autoread

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keep 2 lines around cursor when moving up/down
set so=2

" Keep selection after shift identing
:vnoremap < <gv
:vnoremap > >gv

" Complete : commands
set wildmenu

" Don't complete some files
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" Wrap left and right at end of lines
set whichwrap+=<,>,h,l,[,]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Appearance
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax highlighting
syntax on

" Set the font in MacVim
set guifont=Meslo\ LG\ L\ DZ\ Regular\ for\ Powerline:h12

" Use utf8 encoding
set encoding=utf8

" Unix EOL
set ffs=unix,dos,mac

" Highlight column 81
set colorcolumn=81

" Highlight matching brackets under cursor
set showmatch 
" Cursor blinking speed at matching brackets
set mat=2

" Add a margin to the left to show folding indicator
set foldcolumn=1

" Height of the command bar
set cmdheight=2

"" Highlight current line
set cursorline 

" Highlight current column
set cursorcolumn

" Line numbers
set number

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tab and indent
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy indent from current line when starting a new line
set autoindent

" Do smart autoindenting when starting a new line
set smartindent

" Set tabs to eight columns wide
set tabstop=8

" Always use tabs for indentation
set softtabstop=0

" Set reindent operations to equal one tab
set shiftwidth=8

" Don't replace tabs with spaces
set noexpandtab

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text editing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Allow backspacing over autoindent, line breaks and the start of insert
set backspace=indent,eol,start

" Delete trailing white space on save
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Shortcut mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move a line of text using Command+[jk] on mac
nmap <D-j> mz:m+<cr>`z
nmap <D-k> mz:m-2<cr>`z
vmap <D-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <D-k> :m'<-2<cr>`>my`<mzgv`yo`z

" :W sudo saves the file 
command W w !sudo tee % > /dev/null

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Searching
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Enable incremental search
set incsearch 

" For regular expressions search
set magic

" 
set guioptions+=e
set showtabline=2

" 
execute pathogen#infect()
