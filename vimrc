"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Roel Postelmans
"       postelmansroel@gmail.com
"       https://github.com/roel0
"
" Version:
"       1.0 - 11/02/16
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" disable vi compatibility (emulation of old bugs)
set nocompatible

" Set to auto read when a file is changed from the outside
set autoread

" Keep cursor x lines from border
set so=14

" wrap lines without word break
set wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=0
set wrapmargin=0
set formatoptions-=t

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

" colorsheme
highlight Normal ctermfg=grey ctermbg=darkblue
colorscheme peaksea

" Clipboard enabled
set clipboard+=unnamed,unnamedplus,autoselect 
set fileformat=unix

" show trailing tabs/spaces
set listchars=tab:>-,trail:-
set list

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

" Paste from OS clipboard without autoindent
set pastetoggle=<F2>

" Set command bar height
set cmdheight=2

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Add a bit extra margin to the left
set foldcolumn=1

" Always show the status line
set laststatus=2

" Format the status line
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Switch CWD to the directory of the open buffer
map ,cd :cd %:p:h<cr>:pwd<cr>

" Remap VIM 0 to first non-blank character
map 0 ^

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

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

" Map cctree
map <C-c> :call LoadCCTree()<CR>

" When you forget sudo
cmap w!! w !sudo tee % >/dev/null

" Quickly edit/reload the vimrc file
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

" Remove the need for shift
nnoremap ; :

"Moving in rows, not in lines
nnoremap j gj
nnoremap k gk

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Graphical undo list
nnoremap <F5> :GundoToggle<CR>
imap ff <Esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore the following types
set wildignore+=*/build/*,*.so,*.swp,*.zip
set wildignore+=.elf,*.bin,*.hex
set wildignore+=*/.git/*,*.obj,*.map,*.mmf

" Dir to store backup of files
set backupdir=~/.vim/backup//
" Dir to store the swap files
set directory=~/.vim/swap//

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching is not case sensitive
set ignorecase
" Move to a match while still typing th e pattern
set incsearch
" Highlight search
set hlsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set path for buffer plugin
set path=$PWD/**
" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
" Always open a file in a new buffer
let g:ctrlp_switch_buffer = 0
" Set PWD to .svn/.git folder if found
let g:ctrlp_working_path_mode = 'ra'
" Use ag for filesearching wich is really fast! (sudo pacman -S the_silver_searcher will install ag)
if executable("ag")
  let g:ctrlp_user_command = 'ag %s -l --nocolor --path-to-agignore=~/.agignore  --hidden -g ""'
endif
" Prevent autocomplete to search in include files (which is painfully slow)
set complete-=i
"Better tab completion
set wildmode=longest,list,full
set wildmenu

 "Pathogen manages runtimepath
execute pathogen#infect()
" Load standard tag files
set tags=tags;/
" set the tag list toggle automatically gain focus
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_WinWidth = 30

" Autoclose nerdtree if last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3

" Enable heavy features.
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
let skull = [
\'',
\'            ███████████████████████████',
\'            ███████▀▀▀░░░░░░░▀▀▀███████',
\'            ████▀░░░░░░░░░░░░░░░░░▀████',
\'            ███│░░░░░░░░░░░░░░░░░░░│███',
\'            ██▌│░░░░░░░░░░░░░░░░░░░│▐██',
\'            ██░└┐░░░░░░░░░░░░░░░░░┌┘░██',
\'            ██░░└┐░░░░░░░░░░░░░░░┌┘░░██',
\'            ██░░┌┘▄▄▄▄▄░░░░░▄▄▄▄▄└┐░░██',
\'            ██▌░│██████▌░░░▐██████│░▐██',
\'            ███░│▐███▀▀░░▄░░▀▀███▌│░███',
\'            ██▀─┘░░░░░░░▐█▌░░░░░░░└─▀██',
\'            ██▄░░░▄▄▄▓░░▀█▀░░▓▄▄▄░░░▄██',
\'            ████▄─┘██▌░░░░░░░▐██└─▄████',
\'            █████░░▐█─┬┬┬┬┬┬┬─█▌░░█████',
\'            ████▌░░░▀┬┼┼┼┼┼┼┼┬▀░░░▐████',
\'            █████▄░░░└┴┴┴┴┴┴┴┘░░░▄█████',
\'            ███████▄░░░░░░░░░░░▄███████',
\'            ██████████▄▄▄▄▄▄▄██████████',
\'            ███████████████████████████',
\'  You are about to experience a potent dosage of',
\'              Vim. Watch your steps.',
\'',
\'   ╔══════════════════════════════════════════╗',
\'   ║           ⎋ HERE BE VIMPIRES ⎋           ║',
\'   ╚══════════════════════════════════════════╝',
\]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" toggle between number and relativenumber
function! ToggleNumber()
     if(&relativenumber == 1)
         set norelativenumber
         set number
     else
         set relativenumber
     endif
endfunc
function! LoadCCTree()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    execute "CCTreeLoadDB " db
  endif
endfunc


func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.c :call DeleteTrailingWS()
autocmd BufWrite *.h :call DeleteTrailingWS()
autocmd BufWrite *.py :call DeleteTrailingWS()

" Autoloading Cscope Database
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()
function! CenterHeader(lines) abort
  let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
  let centered_lines = map(copy(a:lines), 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction
let g:startify_custom_header = CenterHeader(skull)
