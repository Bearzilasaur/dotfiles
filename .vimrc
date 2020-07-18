
"===============Vim-plug plugin manager============"
"initiating" 
call plug#begin('~/.vim/plugged')

"**Plugins**"
"Filetree from https://github.com/scrooloose/nerdtree"
Plug 'scrooloose/nerdtree'

"NERDTree icons plugin
Plug 'ryanoasis/vim-devicons'


"Some sort of REPL for vim!!! Need to research
"Plug 'tpope/vim-fireplace'


"=====Syntastic======="
"Syntax highlighting for coding from
"https://github.com/vim-syntastic/syntastic"
Plug 'vim-syntastic/syntastic'

"=====Syntastic Setup======="
"Syntastic is a syntax checker for multiple languages
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"=====Colour========"
"	set t_Co=256
"	set background=dark "kuroi dark theme
"	colorscheme kuroi


"kuroi colour theme from aonemd/kuroi.vim"
Plug 'aonemd/kuroi.vim'

"Goyo focus editor for vim junegunn/goyo.vim
Plug 'junegunn/goyo.vim'

"Airline, status bar at bottom of vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"~~~~~~FOCUSWRITING~~~~~~
"Plugin for writing in vim rather than coding
Plug 'reedes/vim-pencil'

"Highlights paragraph with cursor
Plug 'junegunn/limelight.vim'



"~~~~~VIM LaTeX~~~~~~
Plug 'vim-latex/vim-latex'

"from vim-latex manual: recommended settings:
filetype plugin on
set shellslash
filetype indent on
let g:tex_flavor='latex'

"~~~~ULTISNIPS~~~~
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

call plug#end()


"====================General Setup===================
"ALIASES

"remapping jj to esc for quick escape
imap jj <Esc>

"creating 'tree' shortcut for NERDTreeToggle
nmap <C-n> :NERDTreeToggle

"encoding
set encoding=UTF8

"setting graphical navigation
nnoremap j gj
nnoremap k gk

colo seoul8
syntax on 



