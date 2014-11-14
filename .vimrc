set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" let Vundle manage Vundle
" required! 
Plugin 'gmarik/vundle.vim'


Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-haml'
Plugin 'slim-template/vim-slim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/proton'
Plugin '907th/vim-auto-save'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tfnico/vim-gradle'

Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'mustache/vim-mustache-handlebars'

Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" ================ General Config ====================

set number                      "Line numbers are good
"set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all 
" the plugins.
" let mapleader=","


" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
"set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

"set wildmode=list:longest
"set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
"set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
"set wildignore+=*vim/backups*
"set wildignore+=*sass-cache*
"set wildignore+=*DS_Store*
"set wildignore+=vendor/rails/**
"set wildignore+=vendor/cache/**
"set wildignore+=*.gem
"set wildignore+=log/**
"set wildignore+=tmp/**
"set wildignore+=*.png,*.jpg,*.gif

"

" ================ Scrolling ========================

set scrolloff=3         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1


" ================ ColorScheme ======================
set background=light
colorscheme solarized


" ================ Other Stuff ======================
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Autosave every 200ms
let g:auto_save = 1



" Move current tab into the specified direction.
"
" @param direction -1 for left, 1 for right.
function! TabMove(direction)
    " get number of tab pages.
    let ntp=tabpagenr("$")
    " move tab, if necessary.
    if ntp > 1
        " get number of current tab page.
        let ctpn=tabpagenr()
        " move left.
        if a:direction < 0
            let index=((ctpn-1+ntp-1)%ntp)
        else
            let index=(ctpn%ntp)
        endif

        " move tab page.
        execute "tabmove ".index
    endif
endfunction

" Tab movement
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right>   :tabnext<CR>

" EXPLAIN THIS PLEASE
map <F9> :call TabMove(-1)<CR>
map <F10> :call TabMove(1)<CR>

" Open NERDTree on vim startup (only when there is no file on the cli
function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction

autocmd VimEnter * call StartUp()

" Add 80 characters column highlight
set colorcolumn=80

" VERY IMPORTANT (disables mouse copy pastes :/)
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
map <2-MiddleMouse> <Nop>
imap <2-MiddleMouse> <Nop>
map <3-MiddleMouse> <Nop>
imap <3-MiddleMouse> <Nop>
map <4-MiddleMouse> <Nop>
imap <4-MiddleMouse> <Nop>

:set guioptions-=m  "remove menu bar #in gvim to enable use: set go-=T
:set guioptions-=T  "remove toolbar #in gvim to enable use: set go-=m


set runtimepath^=~/.vim/bundle/ctrlp.vim  "ctrlP
set encoding=utf-8 " fix nerdtree's dir problem in the server

set t_Co=256 "enabe 256 colors in vim

"show whitespace
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

