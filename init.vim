" -------------- Beginning of the Plugin Manager section --------------
call plug#begin('~/.vim/plugged')

"CoC helps you wipe out errors before they even happen.
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

"fuzzy finder - boost your file search to the moon.
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

"---------------Git plugins to show what was changed -------------
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"--------------- Vim Airline status bar -------------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"--------------- Onehalf color theme -------------
Plug 'sonph/onehalf', {'rtp': 'vim/'}

call plug#end()

" -------------- End of the plugin manager section --------------

"---------------=== System settings ===-------------
set number


"---------------=== Fuzzy finder settings ===-------------
map ; :Files<CR>


"---------------=== Window splitting / movement settings ===-------------
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
" Next tab / Previous tab
map <C-e> gt
map <C-w> gT

"---------------=== Tabs and Spaces settings ===-------------
set expandtab
set tabstop=2
set shiftwidth=2


"---------------=== Color settings ===-------------

set background=dark
colorscheme onehalfdark

"---------------=== Vim-Airline color theme settings ===-------------

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
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight Normal guibg=none
highlight NonText guibg=none
