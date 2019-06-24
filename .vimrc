

"setting syntax always on for editing python files
syntax on

"setting indentation on for indentables like for and def and class
filetype indent plugin on

"remapping jj to esc for quick escape
imap jj <Esc>


"Setting absolute line numbers on
set number






"=======================WordProcessorMode==================================
"Setting a WordProcessor mode from https://www.makeuseof.com/tag/5-things-need-put-vim-config-file/
func! WordProcessorMode()
	setlocal textwidth=80
	setlocal smartindent
	setlocal spell spelllang=en_au
	setlocal noexpandtab
endfu

"sets WP to call the function WordProcessorMode()
com! WP call WordProcessorMode()
"==========================================================================






"=====================Focus Writer Mode===================================
func! FocusModeLight()
	set noshowmode
	set noshowcmd
	set spell
	set textwidth=66
	set formatoptions=tacqwn
	set nonumber
	
	SoftPencil
	Goyo 68 " having a few more chars than textwidth hel
	Limelight
	

	colorscheme seoul8_light
	set linespace=7
	set guifont=Menlo:h1
endfu

com! FML call FocusModeLight()

func! FocusModeDark()
	set noshowmode
	set noshowcmd
	set spell
	set textwidth=66
	set formatoptions=tacqwn
	set nonumber
	

	Limelight
	Goyo 68 " having a few more chars than textwidth helps
	colorscheme seoul8
	set linespace=7
	set guifont=Menlo:h14
	SoftPencil
endfu

com!FMD call FocusModeDark()



"===============Vim-plug plugin manager============"
"initiating" 
call plug#begin('~/.vim/plugged')

"**Plugins**"
"Filetree from https://github.com/scrooloose/nerdtree"
Plug 'scrooloose/nerdtree'

"Some sort of REPL for vim!!! Need to research
"Plug 'tpope/vim-fireplace'


"Syntax highlighting for coding from
"https://github.com/vim-syntastic/syntastic"
Plug 'vim-syntastic/syntastic'

"kuroi colour theme from aonemd/kuroi.vim"
Plug 'aonemd/kuroi.vim'

"Goyo focus editor for vim junegunn/goyo.vim
Plug 'junegunn/goyo.vim'


"======FOCUSWRITING======
"Plugin for writing in vim rather than coding
Plug 'reedes/vim-pencil'

"Highlights paragraph with cursor
Plug 'junegunn/limelight.vim'

call plug#end()

"======NERDTREE======"
autocmd vimenter * NERDTree "automatically opens nerdtree when vim starts see github page for more commands/automation


"=====Syntastic======="
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"=====Colour========"
set t_Co=256
set background=dark "kuroi dark theme
colorscheme kuroi

