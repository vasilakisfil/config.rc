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
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tfnico/vim-gradle'

Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'mxw/vim-jsx'


Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'fatih/vim-go'

Plugin 'ekalinin/Dockerfile.vim'

Plugin 'elzr/vim-json'

Plugin 'rhysd/vim-crystal'

Plugin 'christoomey/vim-tmux-navigator'

call vundle#end()            " required
filetype plugin indent on    " required

" ================ General Config ====================

set number                      "Line numbers are good
"set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set autoread                    "Reload files changed outside vim
"no bell and visual bell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

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
let background_color=system('gconftool-2 -g /apps/guake/style/background/color')

if substitute(background_color, '\n\+$', '', '') == "#00002B2B3636"
  set background=dark
  colorscheme solarized
else
  set background=light
  colorscheme solarized
endif



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
let &colorcolumn="80,".join(range(120,999),",")

" VERY IMPORTANT (disables mouse copy pastes :/)
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
map <2-MiddleMouse> <Nop>
imap <2-MiddleMouse> <Nop>
map <3-MiddleMouse> <Nop>
imap <3-MiddleMouse> <Nop>
map <4-MiddleMouse> <Nop>
imap <4-MiddleMouse> <Nop>



set runtimepath^=~/.vim/bundle/ctrlp.vim  "ctrlP
set encoding=utf-8 " fix nerdtree's dir problem in the server

set t_Co=256 "enabe 256 colors in vim

"show whitespace
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

"disable visual flickering
set novb

let g:auto_save_in_insert_mode = 0
let g:syntastic_javascript_checkers = ['jshint']

"saving some space.. go --> guioptions
:set go-=m  "remove menu bar
:set go-=T  "remove toolbar
:set go-=r  "remove right-hand scroll bar
:set go-=L  "remove left-hand scroll bar
:set go-=e "make tabs ligher

let g:NERDTreeWinSize=20

if system("xrandr | grep '*' | cut -d ' ' -f 4 | cut -d 'x' -f 1") > 1900
  :set guifont=Monospace\ 13
else
  :set guifont=Monospace\ 10
endif

"bind F5 to toggling colorscheme
call togglebg#map("<F6>")

nnoremap <F2> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"sane pane navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"conceal [link text](link url) as just link text.
set conceallevel=2
"autocmd BufRead,BufNewFile   *.md setlocal tw=80
"autocmd BufRead,BufNewFile   *.md setlocal fo+=a

"stupid warning
let g:syntastic_eruby_ruby_quiet_messages =
    \ {'regex': 'possibly useless use of a variable in void context'}
