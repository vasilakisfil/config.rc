set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle.vim'

"Plugin 'ycm-core/YouCompleteMe'
"Plugin 'dense-analysis/ale'

"not working with NERDTree :/
"Plugin 'tpope/vim-obsession'
"Plugin 'dhruvasagar/vim-prosession'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'

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
Plugin 'tpope/vim-vinegar'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tfnico/vim-gradle'
Plugin 'vitalk/vim-shebang'

Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'mustache/vim-mustache-handlebars'
Plugin 'joukevandermaas/vim-ember-hbs'
Plugin 'mxw/vim-jsx'

Plugin 'fatih/vim-go'

Plugin 'ekalinin/Dockerfile.vim'

Plugin 'elzr/vim-json'

Plugin 'rhysd/vim-crystal'

Plugin 'elixir-editors/vim-elixir'
Plugin 'slashmili/alchemist.vim'

Plugin 'christoomey/vim-tmux-navigator'

Plugin 'rust-lang/rust.vim'
Plugin 'leafgarland/typescript-vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'enricobacis/vim-airline-clock'

Plugin 'diepm/vim-rest-console'
Plugin 'junegunn/fzf.vim'
set rtp+=~/.fzf
Plugin 'pbogut/fzf-mru.vim'
Plugin 'gcmt/taboo.vim'
Plugin 'junegunn/goyo.vim'

Plugin 'vim-erlang/vim-erlang-runtime'

call vundle#end()            " required
filetype plugin indent on    " required

" ================ General Config ====================
" sets:
" - skin
source ~/.vimrc_config

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
if skin == 'dark'
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
            let index=((ctpn+1)%ntp)
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

" Open NERDTree on vim startup (only when there is no file on the cli)
function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction

autocmd VimEnter * call StartUp()

" Add 80 characters column highlight
let &colorcolumn="80,".join(range(120,999),",")
"unless it's rust
autocmd FileType rust setlocal colorcolumn=100 shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType ruby setlocal colorcolumn=100

" VERY IMPORTANT (disables mouse copy pastes :/)
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
map <2-MiddleMouse> <Nop>
imap <2-MiddleMouse> <Nop>
map <3-MiddleMouse> <Nop>
imap <3-MiddleMouse> <Nop>
map <4-MiddleMouse> <Nop>
imap <4-MiddleMouse> <Nop>


set encoding=utf-8 " fix nerdtree's dir problem in the server

set t_Co=256 "enabe 256 colors in vim

"show whitespace
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

"disable visual flickering
set novb

let g:auto_save_in_insert_mode = 0

"saving some space.. go --> guioptions
:set go-=m  "remove menu bar
:set go-=T  "remove toolbar
:set go-=r  "remove right-hand scroll bar
:set go-=L  "remove left-hand scroll bar
:set go-=e "make tabs ligher

let g:NERDTreeWinSize=20

:set guifont=Monospace\ 12

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

"navigate through copen using meta-j and meta-k
map <M-j> :cn<CR>
map <M-k> :cp<CR>
"open using meta-o
map <M-o> :copen<CR>
map <M-c> :cclose<CR>

:set term=xterm-256color
let NERDTreeIgnore = ['\.beam']

:set wildignore+=node_modules/**/*

"enable jsx only in .jsx files
let g:jsx_ext_required = 1

"the working directory is always the one where the active buffer is located.
"set autochdir
"make sure the working directory is set correctly when changing folders from
"NERDTree
let g:NERDTreeChDirMode=3

"ALE linting stuff
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_insert_leave = 0
"let g:ale_lint_on_enter = 0
"let g:ale_lint_on_save = 0
"let g:ale_lint_on_filetype_changed = 0

"essentially ctrl can also be part of it mapping to Kate/latex favorite shortcut
nmap <M-lt> :RustFmt<CR>
let g:rustfmt_options=''

let g:airline_theme='light'

"font shortcuts..
let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
function! SetFontSize(newsize)
  if has("gui_running")
    let fontname = substitute(&guifont, s:pattern, '\1', '')
    let newfont = fontname . a:newsize
    let &guifont = newfont
  else
    echoerr "You need to run the GTK2 version of Vim to use this function."
  endif
  set guioptions+=b
  set guioptions-=b
endfunction
function! IncreaseFont(amount)
  let cursize = substitute(&guifont, s:pattern, '\2', '')
  SetFontSize(cursize + 1)
endfunction
function! DecreaseFont(amount)
  let cursize = substitute(&guifont, s:pattern, '\2', '')
  SetFontSize(cursize + 1)
endfunction
command! -nargs=1 F call SetFontSize(<f-args>)

"jesus just jesus, why on earth...
"let g:ycm_enable_diagnostic_highlighting = 0 
"let g:ycm_show_diagnostics_ui = 0
"let g:ycm_enable_diagnostic_signs = 0

"some common patterns extracted as shortcuts
fun! s:polite_sub(search, ...) range
    let l:replace = get(a:, 1, '')
    echom mode()
    execute a:firstline . ',' . a:lastline . 's/' . a:search . '/' . l:replace . '/gc'
endfun
:command Picks call s:polite_sub("pick", "s")
:command -nargs=+ -range=% Repl :<line1>,<line2> call s:polite_sub(<f-args>)

fun! s:global_search(term, ...)
    let l:type = get(a:, 1, expand('%:e'))
    execute ':grep -F "' . a:term . '" **/*.' . l:type
endfun
:command -nargs=+ S call s:global_search(<f-args>)

let g:vrc_curl_opts = {
  \ '-sS': '',
  \ '--connect-timeout': 10,
  \ '-i': '',
  \ '--max-time': 60,
  \ '-k': '',
\}

"map fzf to ctrlp binding
"use different defaults than the .zsh FZF_DEFAULT_COMMAND
command! -nargs=0 FzfFind call fzf#run(fzf#wrap({'source': 'rg --files'}))
nnoremap <C-p> :FzfFind<Cr>

"new way of searching (instead of :S)
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --smart-case --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
command! -bang -nargs=* FindAll call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --smart-case --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
"TODO: <C-f> is already a page down for vim, need to remap this
nmap <C-f> :Find<CR>
"searching buffers
nmap <C-b> :Buffers<CR>

set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case

"gvim only :/
nmap <C-q> :NERDTreeToggle<CR>

set guioptions-=e
set sessionoptions+=tabpages,globals
let g:taboo_tab_format = " %P/ %m "

"much faster than guake -t && guake --execute-command uptime
"ctrl + Enter runs cargo check (cc)
nmap <silent> <C-CR> :call system("dbus-send --session --type=method_call --dest=org.guake3.RemoteControl /org/guake3/RemoteControl org.guake3.RemoteControl.show_hide && dbus-send --session --type=method_call --dest=org.guake3.RemoteControl /org/guake3/RemoteControl org.guake3.RemoteControl.execute_command string:'\003 cc'")<enter> 
"ctrl + Shift + Enter runs cargo build (cb)
nmap <silent> <C-S-CR> :call system("dbus-send --session --type=method_call --dest=org.guake3.RemoteControl /org/guake3/RemoteControl org.guake3.RemoteControl.show_hide && dbus-send --session --type=method_call --dest=org.guake3.RemoteControl /org/guake3/RemoteControl org.guake3.RemoteControl.execute_command string:'\003 cb'")<enter> 
"ctrl + Enter runs cargo check --tests (cc --tests)
nmap <silent> <C-BS> :call system("dbus-send --session --type=method_call --dest=org.guake3.RemoteControl /org/guake3/RemoteControl org.guake3.RemoteControl.show_hide && dbus-send --session --type=method_call --dest=org.guake3.RemoteControl /org/guake3/RemoteControl org.guake3.RemoteControl.execute_command string:'\003 cc --tests'")<enter> 
"ctrl + Shift + Enter runs cargo tests (ct)
nmap <silent> <C-S-BS> :call system("dbus-send --session --type=method_call --dest=org.guake3.RemoteControl /org/guake3/RemoteControl org.guake3.RemoteControl.show_hide && dbus-send --session --type=method_call --dest=org.guake3.RemoteControl /org/guake3/RemoteControl org.guake3.RemoteControl.execute_command string:'\003 ct'")<enter> 

fun! s:redraw()
  set guiheadroom=0
  let cursize = substitute(&guifont, s:pattern, '\2', '')
  call SetFontSize(cursize)
  "no bell and visual bell
  set noerrorbells visualbell t_vb=
  if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
  endif
endfun

command! -nargs=0 Fix call s:redraw()
let NERDTreeMinimalUI = 1
let g:session_autosave = 'no'

set ttyfast

"smartcase requires ignorecase
set ignorecase
set smartcase

set switchbuf=useopen
"function NERDTreeMyOpenFile(node)
"    call a:node.activate({'reuse': 'currenttab', 'where': 'p'})
"endfunction
"autocmd VimEnter * :call NERDTreeAddKeyMap({ 'key': 'o', 'callback': 'NERDTreeMyOpenFile', 'scope': 'FileNode', 'override': 1 })
"autocmd VimEnter * :call NERDTreeAddKeyMap({ 'key': '<CR>', 'callback': 'NERDTreeMyOpenFile', 'scope': 'FileNode', 'override': 1 })
"autocmd VimEnter * :call NERDTreeAddKeyMap({'key': '<2-LeftMouse>', 'callback': 'NERDTreeMyOpenFile', 'scope': 'FileNode', 'override': 1 })
let NERDTreeCustomOpenArgs = {'file': {'reuse': 'currenttab', 'where': 'p'}, 'dir': {}}

"open last used buffer with backspace in normal mode
nnoremap <BS> <C-^>

fun! s:reload()
  so $MYVIMRC
  Fix
endfun
command! -nargs=0 Reload call s:reload()

nmap =j :%!python -m json.tool<CR>
let g:vrc_response_default_content_type = 'application/json'
