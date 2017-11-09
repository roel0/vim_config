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

" Set vim direcotry to .vim (windows)
let &runtimepath.=',$HOME/.vim'
" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" disable vi compatibility (emulation of old bugs)
set nocompatible

" Set to auto read when a file is changed from the outside
set autoread

" Keep cursor x lines from border
set so=20

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

" Set to auto read when a file is changed from the outside
set autoread

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","
" Select pasted text
nmap gp `[v`]
" Switch CWD to the directory of the open buffer
nmap <Leader>cd :cd %:p:h<cr>:pwd<cr>

" Remap VIM 0 to first non-blank character
nmap 0 ^

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
nmap <space> /
nmap <C-space> ?

" Command to open bufferbrowser
nmap <Leader>b :CtrlPBuffer<CR>

" Remaps for holding-shift-to-long-errors which happens to often
command WQ wq
command Wq wq
command W w
command Q q

" Disable arrow keys because its a bad habit to use them!
map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>

" switch between header/source with F4
nmap <F4> :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>

" Map S as delete word and replace it without touching register
nmap S "_diwP

" turn off search highlight
nmap <Leader><space> :nohlsearch<CR>

" Quickly edit/reload the vimrc file
nmap <Leader>ev :e $MYVIMRC<CR>
nmap <Leader>sv :so $MYVIMRC<CR>

" Remove the need for shift
nmap ; :

"Moving in rows, not in lines
nmap j gj
nmap k gk

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Graphical undo list
nmap <F5> :GundoToggle<CR>

" check the Syntax of source file
nmap <C-w>e :call SyntasticMakefile()<CR>

" Map togglenumber
nmap <Leader>, :call ToggleNumber()<CR>

" map it to ' , near the search /
nmap ' :TlistToggle<CR>

" Remove the Windows ^M - when the encodings gets messed up
nmap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore the following types
set wildignore+=*.so,*.swp,*.zip
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
  let g:ctrlp_user_command = 'ag %s -l --nocolor --path-to-ignore=~/.agignore  --hidden -g ""'
endif
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.vim/ctrlp'
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

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3

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
let delimitMate_expand_cr = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_w = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
let g:syntastic_c_remove_include_errors=0
let g:syntastic_c_checkers=['make']
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

function! UpdateCscope()
    let db = findfile("cscope.out", ".;")
    let cwd = getcwd()
    let db_path = ""
    " First check if there is already a database
    if !empty(db)
        let db_path = strpart(db, 0, match(db, "/cscope.out$"))
    else
        " Find the root dir of the git project (if it is a git project)
        while 1
            let new_path = system('git rev-parse --show-toplevel')
            let new_path = expand(substitute(new_path,"\n","",""))
            if !isdirectory(new_path)
                if !isdirectory(db_path)
                    return
                endif
                break
            endif
            let db_path = new_path
            exec 'cd' db_path
            exec 'cd ..'
        endwhile
    endif
    echo db_path
    exec 'cd' db_path
    call system('cscope_gen.sh')
    exec 'cd' cwd
endfunction

autocmd BufWrite *.c :call UpdateCscope()
autocmd BufWrite *.groovy :call UpdateCscope()
autocmd BufWrite *.h :call UpdateCscope()
autocmd BufWrite *.py :call UpdateCscope()

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

" Determine syntactics based on compiling with makefile
function! SyntasticMakefile()
  " FInd the makefile of the open source file
 let oldir = getcwd()
  let dir = findfile("makefile", ".;")
  if (!empty(dir))
    let path = strpart(dir, 0, match(dir, "/makefile$"))
    exe "cd " . path
    exe "SyntasticCheck"
    exe "cd " . oldir
  endif
endfunction

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! Diffsaved call s:DiffWithSaved()

function! Strip(input_string)
    return substitute(a:input_string, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction
