set shell=/bin/bash

set nocompatible

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'bling/vim-airline'
Bundle 'airblade/vim-gitgutter'
Bundle 'kien/ctrlp.vim'
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'rking/ag.vim'
Bundle 'sjl/gundo.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'slim-template/vim-slim.git'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-liquid'
Bundle 'tpope/vim-markdown'
Bundle 'mattn/gist-vim'
Bundle 'terryma/vim-smooth-scroll'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'vim-scripts/Gundo'
Bundle 'altercation/vim-colors-solarized'
Bundle 'chriskempson/base16-vim'
Bundle 'kana/vim-fakeclip'
Bundle 'vim-airline/vim-airline-themes'

set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

noremap <silent> <c-k> :call smooth_scroll#up(&scroll, 10, 4)<CR>
noremap <silent> <c-j> :call smooth_scroll#down(&scroll, 10, 4)<CR>

nnoremap º :m+<CR>==
nnoremap ∆ :m-2<CR>==
inoremap º <Esc>:m+<CR>==gi
inoremap ∆ <Esc>:m-2<CR>==gi
vnoremap º :m'>+<CR>gv=gv
vnoremap ∆ :m-2<CR>gv=gv



" Preserve editor state when executing a command
function! Preserve(command)
  " Save last search, and cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")
  
  " Execute the specified command
  execute a:command

  " Restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" Strip trailing whitespace
function! StripTrailingWhitespace()
  call Preserve("%s/\\s\\+$//e")
endfunction

if has("autocmd")
  filetype on
  filetype indent on
  filetype plugin on
  autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd BufWritePre *.css,*.html,*.js,*.json,*.md,*.php,*.py,*.rb,*.scss,*.sh,*.txt :call StripTrailingWhitespace()
endif
          
if has("syntax")
  syntax enable
  let g:solarized_visibility = "high"
  let g:solarized_contrast = "high"
  let g:airline_theme = "solarized"
  set t_Co=16
  set background=dark
  silent! colorscheme solarized
endif
    

if !has('gui_running')
  " Compatibility for Terminal
  let g:solarized_termtrans=1
  "let g:solarized_termcolors=256
endif

if has("cmdline_info")
  set ruler
  set showcmd
  set showmode
endif

if has('statusline')
  set laststatus=2
  set statusline=%F%m%r%h%w\  "fullpath and status modified sign
  "set statusline+=%{fugitive#statusline()}\  "git
  set statusline+=\ [line\ %l\/%L]  "line number
  set statusline +=\ [col\ %v\]  "virtual column number
endif

if has("wildmenu")
  set wildmenu
  set wildmode=longest,list
  if has ("wildignore")
    set wildignore+=*.a,*.pyc,*.o,*.orig
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png
    set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=*~,*.sw?,*.tmp
  endif
endif

if has("extra_search")
  set hlsearch          " highlight matches
  set incsearch         " search as characters are entered
  set ignorecase
  set smartcase
endif
              
                  
augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
  
  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell
  
  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-

  " save folding state
  "autocmd BufWrite * mkview
  "autocmd BufRead * silent loadview
augroup END
  
                                                  
" Leader
let mapleader = ","

set autoread
"set smartindent
set backspace=indent,eol,start
"set nobackup
"set nowritebackup
"set noswapfile
set history=50
set ruler
set showcmd
set incsearch
set laststatus=2        " always show status bar
set autowrite
set encoding=utf-8 nobomb
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=syntax   " Other acceptable values are marker, manual, expr, syntax, diff.

set nowrap
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set number
set numberwidth=5
set cursorline
set scrolloff=3
set nostartofline
set noerrorbells
set novisualbell
set vb t_vb=

set list
set listchars=tab:▸\
set listchars+=trail:·
set listchars+=nbsp:_

set backupdir=$HOME/.vim/backups
set directory=$HOME/.vim/swaps
set viminfo+=n$HOME/.vim/viminfo

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Show nerd tree
nmap <leader>t :NERDTree<cr>

" Configure status bar
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme = "solarized"

set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

if has("gui_running")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        set guifont=Inconsolata\ for\ Powerline:h15
    endif
endif


" Fast saving
nmap <leader>s :w!<cr>
" Fast reload
nmap <leader>r :e!<cr>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

if has("persistent_undo")
  set undofile
  set undodir=$HOME/.vim/undo
endif

let g:ackprg = 'ag --nogroup --nocolor --column'

" open ag.vim
nnoremap <leader>a :Ag

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" save session
nnoremap <leader>s :mksession<CR>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp ~/.vimrc<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" space open/closes folds
"nnoremap <space> za

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Run commands that require an interactive shell
" nnoremap <Leader>r :RunInInteractiveShell<space>

" Preserve indentation while pasting text from the OS X c lipboard
noremap <leader>p :set paste<CR><Bar>:put *<CR><Bar>:set nopaste<CR>
set clipboard=unnamed
" unnamed

" strip whitespace
noremap <leader>$ :call StripTrailingWhitespace()<CR>

" auto indent file
map <Leader>i mmgg=G'm<CR>

" paste from system register
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<CR>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]

" RSpec.vim mappings
"let g:rspec_runner = "os_x_iterm"

"map <Leader>t :call RunCurrentSpecFile()<CR>
"map <Leader>s :call RunNearestSpec()<CR>
"map <Leader>l :call RunLastSpec()<CR>
"map <Leader>a :call RunAllSpecs()<CR>

" ====== Gist =======

let g:gist_show_privates = 1
let g:gist_post_private = 1
let g:gist_detect_filetype = 1
let g:gist_clip_command = 'pbcopy'

" ====== Syntastic =======

" Use passive mode for html since hints are mostly bogus
let syntastic_mode_map = { 'passive_filetypes': ['html'] }


" ====== Ctrl-p =======

let g:ctrlp_switch_buffer = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_extensions = ['tag']
let g:ctrlp_max_height = 20
let g:ctrlp_show_hidden = 1

" clear search cache shortcut:
map <Leader>ca :CtrlPClearAllCaches<CR>

set wildmenu "Turn on WiLd menu

set wildignore+=*typo3temp*
set wildignore+=*typo3_src*
set wildignore+=*import_temp*
set wildignore+=*_processed_*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*.png,*.jpg,*.gif,*.ico
set wildignore+=*.ex4
set wildignore+=*/node_modules/*,*/dist/*



let g:ctrlp_filter_greps = "".
  \ "egrep -iv '\\.(" .
  \ "mx4|jar|class|swp|swo|log|so|o|pyc|jpe?g|png|gif|mo|po" .
  \ ")$' | " .
  \ "egrep -v '^(\\./)?(" .
  \ "deploy/|lib/|classes/|libs/|deploy/vendor/|.git/|.hg/|.svn/|.*migrations/|docs/build/" .
  \ ")'"



au BufRead,BufNewFile *.mq4 set filetype=c

set iskeyword-=_

