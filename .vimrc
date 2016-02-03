"-------------
"   EDITOR
"#############

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" disable vi compatibility (emulation of old bugs)
set nocompatible
" wrap lines without word break
:set wrap
:set linebreak
:set nolist  " list disables linebreak
:set textwidth=0
:set wrapmargin=0
:set formatoptions-=t
" turn line numbers o
set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */
compiler gcc
set errorformat^=%-G%f:%l:\ warning:%m
" size of a hard tabstop
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" turn syntax highlighting on
syntax on
" syntax higlighting related to the extension
filetype plugin indent on
highlight Normal ctermfg=grey ctermbg=darkblue
colorscheme peaksea
" Clipboard enabled
set clipboard+=unnamed,unnamedplus,autoselect 
set fileformat=unix
" show trailing tabs/spaces
set listchars=tab:>-,trail:-
set list
" Autoclose nerdtree if last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"view current command
set showcmd
" draws horizontal line under the currunt line
set cursorline
" Don't redraw the screen during macros
set lazyredraw
" Remmber more commands
set history=10000
" change the terminal's title
set title
"-------------
"  MAPPINGS
"#############

" Autocomplete with jk-keys
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))
" Command to open bufferbrowser
map ,b :CtrlPBuffer<CR>
" Remaps for holding-shift-to-long-errors which happens to often
command WQ wq
command Wq wq
command W w
command Q q
" Disable arrow keys because its a bad habit to use them!
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
" switch between header/source with F4
nmap <F4> :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>
" map it to ' , near the search /
nmap ' :TlistToggle<CR>
" NERDTree plugin (fileexplorer)
map <C-n> :NERDTreeToggle<CR>
" Map S as delete word and replace it without touching register
nnoremap S "_diwP
" turn off search highlight
nnoremap ,<space> :nohlsearch<CR>
" Map togglenumber
map <C-m> :call ToggleNumber()<CR>
" When you forget sudo
cmap w!! w !sudo tee % >/dev/null
"-------------
"   FILES
"#############

" Ignore the following types
set wildignore+=*/build/*,*.so,*.swp,*.zip,*.elf,*.bin,*.hex
set wildignore+=*/.git/*,*.obj,*.map,*.mmf
" Dir to store backup of files
set backupdir=~/.vim/backup//
" Dir to store the swap files
set directory=~/.vim/swap//

"-------------
"  SEARCHING
"#############

" Searching is not case sensitive
set ignorecase
" Move to a match while still typing th e pattern
set incsearch
" Highlight search
set hlsearch


"-------------
"    UNDO
"#############

" Keep track of undo history of buffers in the background
set hidden
" Persistent undo
set undofile
" Place to store the undo history
set undodir=~/.vim/undo//
" Max number of undo's
set undolevels=1000
" Number of lines for undo
set undoreload=10000

"-------------
"   DEVELOP
"#############

"Set path for buffer plugin
set path=$PWD/**
" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
" Always open a file in a new buffer
let g:ctrlp_switch_buffer = 0
" Respect changes in the current PWD
let g:ctrlp_working_path_mode = 0
" Use ag for filesearching wich is really fast! (sudo pacman -S the_silver_searcher will install ag)
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" Prevent autocomplete to search in include files (which is painfully slow)
set complete-=i
"Better tab completion
set wildmode=longest,list,full
set wildmenu

"-------------
"    OTHER
"#############

 "Pathogen manages runtimepath
execute pathogen#infect()
" Load standard tag files
set tags=tags;/
" set the tag list toggle automatically gain focus
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_WinWidth = 30

"-------------
"  FUNCTIONS
"#############
" toggle between number and relativenumber
function! ToggleNumber()
     if(&relativenumber == 1)
         set norelativenumber
         set number
     else
         set relativenumber
     endif
endfunc
