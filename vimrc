"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Roel Postelmans
"       postelmansroel@gmail.com
"       https://github.com/roel0
"
" Version:
"       2.0 - 09/03/18
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
call plug#begin('~/.vim/plugged')
    " autocomplete
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'Shougo/deoplete.nvim'
    Plug 'tweekmonster/deoplete-clang2'
    " Undo tree
    Plug 'sjl/gundo.vim'
    " Fuzzy file search
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    " Good cscope bindings
    Plug 'gnattishness/cscope_maps'
    " Startup screen
    Plug 'mhinz/vim-startify'
    " Comment pluging
    Plug 'scrooloose/nerdcommenter'
    " Autoclosing ({'...'})
    Plug 'Townk/vim-autoclose'
    " Find project root
    Plug 'airblade/vim-rooter'
    " Collection of syntax files
    Plug 'sheerun/vim-polyglot'
    " Colorsheme
    Plug 'morhetz/gruvbox'
    " Syntax checker
    Plug 'w0rp/ale'
    " Status line
    Plug 'itchyny/lightline.vim'
    " Whats in a name
    Plug 'tpope/vim-surround'
call plug#end()

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
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" turn syntax highlighting on
syntax on

" syntax higlighting related to the extension
filetype plugin indent on

" colorsheme
try
    colorscheme gruvbox
    set background=dark
catch /^Vim\%((\a\+)\)\=:E185/
    silent! colorscheme default
endtry

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

" Remember more commands
set history=10000

" change the terminal's title
set title

" Set command bar height
set cmdheight=2

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Add a bit extra margin to the left
set foldcolumn=1

" Always show the status line
set laststatus=2
" Remove duplicated insert
set noshowmode

autocmd VimResized * wincmd =
" Prevent autocomplete to search in include files (which is painfully slow)
set complete-=i
" Prevent preview window from opening
set completeopt-=preview
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
nmap <Leader>b :Buffers<CR>
nmap <Leader>c :Commits<CR>
nmap <C-p> :Rooter<CR>:Files<CR>

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

" Paste from OS clipboard without autoindent
set pastetoggle=<F2>

" Graphical undo list
nmap <F5> :GundoToggle<CR>
" Diff current buffer with the file on disk
nmap <F6> :Diffsaved

" Map S as delete word and replace it without touching register
nmap S "_diwP

" turn off search highlight
nmap <Leader><space> :nohlsearch<CR>
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

" Map togglenumber
nmap <Leader>, :call ToggleRelNumber()<CR>
nmap <Leader>. :call ToggleNumber()<CR>

" map it to ' , near the search /
nmap ' :TlistToggle<CR>

" Remove the Windows ^M - when the encodings gets messed up
nmap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
nmap <silent> <S-k> <Plug>(ale_previous_wrap)
nmap <silent> <S-j> <Plug>(ale_next_wrap)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore the following types
set wildignore+=*.so,*.swp,*.zip
set wildignore+=.elf,*.bin,*.hex
set wildignore+=*/.git/*,*.obj,*.map,*.mmf

" Dir to store backup of files
set backupdir=~/.vim/backup//
" Disable swap file
set noswapfile
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
"Better tab completion
set wildmode=longest,list,full
set wildmenu
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#executable = '/usr/bin/clang'
" Load standard tag files
set tags=tags;/
let emoji = [
            \'                     `---./////::///:--.`                         ',
            \'                   --:/::::::/::::::/:::::.                       ',
            \'               `--::::/::::::/::::::/::::::/-``      -:` ::.-:`   ',
            \'  -.:.-.     ``:::::///::::///::::://::::://:::.      :-./.::--   ',
            \'-.:`:`.-    .://:::/:-  `-////:::///.`  ////::::.     `:/:::--`   ',
            \'-//::/:-   `-:://:::-     :/://::::-    `/://:::::-```::://::     ',
            \' :/:::/-```::////:::-    `:////:::/:    .////:::////::::///:-     ',
            \' -::://://:://///:://:.`.::////::://-.`.:////:::////` ``.//-      ',
            \'  `:/:```:://////://////://////://////://////://////.    -/:.     ',
            \'  `:::  :::::/:/::::/:/::::/:/::::/:/::::/:/::::/:/::`    .:::`   ',
            \'  :::`  :/:::/://:::/://:::/://:::/://:::/://::/-.:/:-..```-:/:.  ',
            \' `:::```:::::--/:::////:::////:::////:::////:::.``:::///://:/://-`',
            \' ::::::::::::``:::::::/::::::/:::::://:::::/:-. `-:/::::-:--.....`',
            \' -:-...``.:::. `--://///::::///::::///:://:-.   `-//.             ',
            \'          -:/:`   .--://:://///::////:::-..     .:/-`             ',
            \'           `//:`     ```.//:-//::/---```       .:/-`              ',
            \'            .//:-        ..  ```-:           .:::.`               ',
            \'             `:/::-    `--::::-.::/:.      -::::`                 ',
            \'               .:::::-` ` `..//:-:::/-` .-:/:..                   ',
            \'                 ``-:::/---. `:::-///:::/:..`                     ',
            \'                    `.-::-:::-`::::://::`                         ',
            \'                           `...::::://:::`                        ',
            \'                              `:::::/::::-                        ',
            \'                                ::////::/`                        ',
            \'                                 .::-.``                          ',
            \'                                                                  ',
            \'         ╔══════════════════════════════════════════╗',
            \'         ║           ⎋ HERE BE VIMPIRES ⎋           ║',
            \'         ╚══════════════════════════════════════════╝',
\]


let g:ale_linters = {
\   'python': ['flake8'],
\   'c': ['gcc'],
\}
let g:ale_c_parse_makefile=1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" toggle between number and relativenumber
function! ToggleRelNumber()
     if(&relativenumber == 1)
         set norelativenumber
         set number
     else
         set relativenumber
     endif
endfunc

function! ToggleNumber()
    if(&number == 0)
        set number
    else
        set nonumber
    endif
endfunc

func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.c,*.h,*.py,*.groovy :call DeleteTrailingWS()

" Autoloading Cscope Database
function! LoadCscope()
    let db = findfile("cscope.out", ".;")
    if (!empty(db))
        let path = strpart(db, 0, match(db, "/cscope.out$"))
        set nocscopeverbose
        exe "cs add " . db . " " . path
        set cscopetag cscopeverbose
    endif
endfunction
au BufEnter /* call LoadCscope()

function! CenterHeader(lines) abort
    let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
    let centered_lines = map(copy(a:lines), 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
    return centered_lines
endfunction
let g:startify_custom_header = CenterHeader(g:emoji)

function! s:DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! Diffsaved call s:DiffWithSaved()

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

function! SetFlake8Options()
    if !exists('g:SetFlake8OptionsRunning')
        let g:SetFlake8OptionsRunning = 1
        let l:path_opt = expand('%:p:h') . ';'
        let l:flake8_path = findfile("setup.cfg", l:path_opt)
        if type(l:flake8_path) == type([])
            let l:flake8_path = l:flake8_path[0]
        endif
        if l:flake8_path != ""
            let l:flake8_path = fnamemodify(l:flake8_path, '.:%p')
            let g:ale_python_flake8_options='--config ' . l:flake8_path
        endif
    endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Async ( <3 VIM8 )
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! AsyncStart(command, cb)
    if v:version < 800
        echoerr 'Async functions require VIM8'
        return
    endif
    call job_start(a:command, {'close_cb': a:cb})
endfunction

"
" Auto update cscope database in background
"
function! UpdateCscopeCb(channel)
    unlet g:UpdateCscopeRunning
    call LoadCscope()
endfunction

function! UpdateCscope()
    if !exists('g:UpdateCscopeRunning')
        let g:UpdateCscopeRunning = 1
        exe 'silent cs kill -1'
        call AsyncStart('cscope_gen.sh', 'UpdateCscopeCb')
    endif
endfunction

function! SourceEnter()
    exe 'silent Rooter'
    call UpdateCscope()
endfunction

autocmd BufWrite *.c,*.groovy,*.h,*.py call SourceEnter()
autocmd BufRead *.c,*.groovy,*.h,*.py call SourceEnter()
autocmd BufRead *.py :call SetFlake8Options()
