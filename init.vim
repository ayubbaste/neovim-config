" -------------- Plugin manager section --------------
call plug#begin('~/.vim/plugged')

"CoC helps you wipe out errors before they even happen.
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" don't forget to install extension for coc.nvim
" CocInstall coc-pyright coc-prettier coc-git coc-json coc-docker coc-yaml coc-css
" coc-pyright       static type checker for Python
" coc-prettier      A very popular code formatter
" coc-git           A git plugin to show which line is added/deleted and not committed
" coc-json          JSON file formatting plugin
" coc-docker        Dockerfile and docker-compose formatters
" coc-yaml          Yaml plugin for Kubernetes and terraform files

" Sophisticated python syntax highlighting.
Plug 'vim-python/python-syntax'
" Indent python using pep8 recommendations
Plug 'Vimjas/vim-python-pep8-indent'

" Fuzzy finder - boost your file search to the moon.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"Auto Pairs - just adds a closing bracket, paren, quote or whatever you need!
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'

"Tabs and Spaces
"vim-sleuth analyse the project and decide the spacing for you.
Plug 'tpope/vim-sleuth'

"If you often work on other projects there are plenty of different style
"guides.
Plug 'editorconfig/editorconfig-vim'

" Git plugins to show what was changed
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Vim Airline статусная строка 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Onehalf color theme
Plug 'sonph/onehalf', {'rtp': 'vim/'}

call plug#end()

" -------------- END of the Plugin manager section --------------


"---------------=== Main settings ===-------------
" turn on line numbering
set number


"---------------=== Syntax and file types ===-------------
syntax on                      " Syntax highlighting; also does an implicit filetype on
filetype plugin indent on      " Enable detection, plugin , and indent for filetype
set backspace=indent,eol,start " This gets backspace to work in some situations

" sane editing
set foldlevel=99  " go deep
set autoindent    " maintain indentation from prev line
set tabstop=4     " number of spaces <Tab> represents.  For Python.
set shiftwidth=4  " number of spaces for indentation.  Same as tabstop. For Python.
set softtabstop=4
set smarttab      " at the beginning of the line, insert spaces according to shiftwidth
set smartindent
set expandtab     " <Tab> inserts spaces, not '\t'
set colorcolumn=80
set viminfo='25,\"50,n~/.viminfo
set tw=79


"---------------=== Fuzzy finder settings ===-------------
map ; :Files<CR>


"---------------=== Window splitting & movement ===-------------
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>


"---------------=== Tabs ===-------------
" Next tab / Preview tab
map <C-e> gt
map <C-w> gT


"---------------=== Color settings ===-------------
set background=dark
colorscheme onehalfdark
"colorscheme torte

"---------------=== Vim-Airline settings ===-------------
" https://github.com/vim-airline/vim-airline/blob/master/doc/airline.txt

let g:airline_theme='base16_bright'                 " color theme
let g:airline#extensions#wordcount#disabled = 1     " disable word count
let g:airline_section_z = '☵  %1l/%L/%v'            " setting up the section with strings
let g:airline_section_warning = ''                  " disable the error output section
let g:airline#extensions#tabline#enabled = 1        " enable tabs
let g:airline#extensions#tabline#tabs_label = ''    " remove the word Tabs in the left corner
let g:airline#extensions#tabline#fnamemod = ':t'    " only the name of the files on the tab
let g:airline#extensions#tabline#show_tab_count = 0 " do not show the number of tabs in the right corner
let g:airline#extensions#tabline#show_tab_nr = 0    " do not show clutch numbers


"---------------=== Remove VIM background ===-------------
" Must be after all color settings
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight Normal guibg=none
highlight NonText guibg=none
