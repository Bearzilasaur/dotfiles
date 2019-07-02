
"====================NORMAL MODE=====================
func! NormalMode()

	"setting syntax always on for editing python files
	syntax on

	"setting indentation on for indentables like for and def and class
	filetype indent plugin on

	"Setting absolute and relative line numbers on
	set rnu nu

	"=====Colour========"
	set t_Co=256
	set background=dark "kuroi dark theme
	colorscheme kuroi

	"undo Focus Modes
	Limelight!
	NoPencil
	Goyo!

	"======Text========
	set linespace=0		
	set guifont=Menlo:h12

endfu

com! NM call NormalMode()
"=====================================================




"====================General Setup===================
"ALIASES

"remapping jj to esc for quick escape
imap jj <Esc>

"creating 'tree' shortcut for NERDTreeToggle
nmap <C-n> :NERDTreeToggle

"normal mode
autocmd vimenter *  NM

"encoding
set encoding=utf8

"Make backspace work
set backspace=indent,eol,start

"setting up Omnifunc for autocompletion
set omnifunc=syntaxcomplete#Complete "set omnifunc to syntax completion

" start litecorrect for markdown
augroup litecorrect
	autocmd!
	autocmd FileType markdown,mkd call litecorrect#init()
augroup END
   

"=======PANDOC==========
let g:pandoc#biblio#bibs = ['/Users/tinabaum/Zotero/BibTex/mylib.bib']
let g:pandoc#filetypes#handled = ["pandoc", "markdown"]

"Wordcount from stackoverflow.com/questions/114431
function! WordCount()
   let s:old_status = v:statusmsg
   let position = getpos(".")
   exe ":silent normal g\<c-g>"
   let stat = v:statusmsg
   let s:word_count = 0
   if stat != '--No lines in buffer--'
   	let s:word_count = str2nr(split(v:statusmsg)[11])
        let v:statusmsg = s:old_status
   end
   call setpos('.', position)
   return s:word_count 
endfunction


"Create status line
set statusline=%f%=%{WordCount()}\ words\ -\ %{strftime('%R')}               
                 
                 

                 
                 
                 
"======NERDTREE======"
autocmd vimenter * NERDTree "automatically opens nerdtree when vim starts see github page for more commands/automation


"=====Syntastic Setup======="
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"~~~~~Vim LaTeX~~~~~~
"from vim-latex manual: recommended settings:
filetype plugin on
set shellslash
filetype indent on
let g:tex_flavor='latex'


"===========ULTISNIPS==================
"NOTE:This section needs to include snippets for automatic setup of
"either markdown (.md) or LaTeX(.tex) files so I can insert citations 
"in focus modes


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"



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
	set guifont=Menlo:h12
endfu

com! FML call FocusModeLight()

func! FocusModeDark()
	set noshowmode
	set noshowcmd
	set spell
	set textwidth=66
	set formatoptions=tacqwn
	set nonumber
	

	SoftPencil
	Goyo 68 " having a few more chars than textwidth helps
	Limelight
	
	colorscheme seoul8
	set linespace=7
	set guifont=Menlo:h12
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

"~~~~~~~~~THEMES~~~~~~~~~~~~~
Plug 'aonemd/kuroi.vim'
Plug 'sickill/vim-monokai'


"Airline, status bar at bottom of vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"~~~~~~FOCUSWRITING~~~~~~
"Plugin for writing in vim rather than coding
Plug 'reedes/vim-pencil'

"Highlights paragraph with cursor
Plug 'junegunn/limelight.vim'

"Goyo focus editor for vim junegunn/goyo.vim
Plug 'junegunn/goyo.vim'

"NERDTree icons plugin
Plug 'ryanoasis/vim-devicons'

"Autocorrect for Vim
Plug 'reedes/vim-litecorrect'

"Tab completion of autocompletion etc.
Plug 'ervandew/supertab'

"~~~~~VIM LaTeX~~~~~~
Plug 'vim-latex/vim-latex'

"~~~~~ SNIPPETS~~~~~~~
"Plug to create autocompleted snippets
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

"~~~~~ VIM Pandoc~~~~
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'


call plug#end()
