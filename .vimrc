" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" disable vi compatibility (emulation of old bugs)
set nocompatible
" wrap linesi without word break
:set wrap
:set linebreak
:set nolist  " list disables linebreak
:set textwidth=0
:set wrapmargin=0
:set formatoptions-=t
" Pathogen manages runtimepath
execute pathogen#infect()
" turn syntax highlighting on
syntax on
filetype plugin indent on
highlight Normal ctermfg=grey ctermbg=darkblue
colorscheme peaksea
" turn line numbers o
set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" Load standard tag files
set tags=tags;/

" Enhanced keyboard mappings
"
" switch between header/source with F4
nmap <F4> :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>
" map it to ' , near the search /
nmap ' :TlistToggle<CR>
" set the tag list toggle automatically gain focus
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_WinWidth = 30


compiler gcc
set errorformat^=%-G%f:%l:\ warning:%m
set mouse=a
" size of a hard tabstop
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Map S as delete word and replace it without touching register
nnoremap S "_diwP
" Search indicates all matches 
set noincsearch

"search for selected text
vnoremap // y/<C-R>"<CR>

"view current command
set showcmd

" fold functions
set fdm=syntax

"Better tab completion
set wildmode=longest,list,full
set wildmenu

" Clipboard enabled
set clipboard+=unnamed,unnamedplus,autoselect 

set fileformat=unix
" highlight search 
set hlsearch
" Fix ctags not sorted error
set ignorecase 
" show trailing tabs/spaces
set listchars=tab:>-,trail:-
set list

" NERDTree plugin (fileexplorer)
autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
" Autofocuson the file instead of the tree
autocmd VimEnter * if argc() != 0 | wincmd p | endif
" Autoclose nerdtree if last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"CSCOPE
" see plugin dir , I use cscope_maps.vim


