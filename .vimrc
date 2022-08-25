set nocompatible              " be iMproved, required
filetype off                  " required

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
"not working with NERDTree :/
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-haml'
Plug 'slim-template/vim-slim'
Plug 'altercation/vim-colors-solarized'
Plug '907th/vim-auto-save'
Plug 'tpope/vim-surround'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 'vitalk/vim-shebang'
Plug 'pangloss/vim-javascript'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'mxw/vim-jsx'
Plug 'fatih/vim-go'
Plug 'ekalinin/Dockerfile.vim'
Plug 'elzr/vim-json'
Plug 'rhysd/vim-crystal'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'leafgarland/typescript-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'enricobacis/vim-airline-clock'
Plug 'diepm/vim-rest-console'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'gcmt/taboo.vim'
Plug 'junegunn/goyo.vim'
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" ================ General Config ====================
"turn on syntax highlighting
syntax on
filetype plugin indent on

set number
set history=10000
set showcmd
set showmode "Show current mode down the bottom
set gcr=a:blinkon0 "Disable cursor blink
set autoread "Reload files changed outside vim

set noerrorbells visualbell t_vb= "no bell and visual bell
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

set hidden "buffers can be hidden
set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

set encoding=utf-8 " fix nerdtree's dir problem in the server
set t_Co=256 "enabe 256 colors in vim
set term=xterm-256color

"disable visual flickering
set novb

set wildignore+=node_modules/**/*
"conceal [link text](link url) as just link text.
set conceallevel=2

"TODO: fix me
"show whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
" Display tabs and trailing spaces visually
"set list listchars=tab:\ \ ,trail:\ 

"gvim related
set go-=m  "remove menu bar
set go-=T  "remove toolbar
set go-=r  "remove right-hand scroll bar
set go-=L  "remove left-hand scroll bar
set go-=e "make tabs ligher
set guifont=Monospace\ 12
set guioptions-=e

" ================ Indentation ======================
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Turn Off Swap Files
set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" ================ Folds ============================
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Scrolling ========================

set scrolloff=3         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" need to reed colorscheme from guake
set background=light
colorscheme solarized

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" VERY IMPORTANT (disables mouse copy pastes :/)
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
map <2-MiddleMouse> <Nop>
imap <2-MiddleMouse> <Nop>
map <3-MiddleMouse> <Nop>
imap <3-MiddleMouse> <Nop>
map <4-MiddleMouse> <Nop>
imap <4-MiddleMouse> <Nop>

" Autosave every 200ms
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0

" ======== tab related stuff =========
" Tab movement
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right>   :tabnext<CR>

map <F9> :call TabMove(-1)<CR>
map <F10> :call TabMove(1)<CR>

let g:taboo_tab_format = " %P/ %m "

" Move current tab into the specified direction.
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

" ========= file-related initializations ===========
function! DefaultStuff()
  " Add 80 characters column highlight
  let &colorcolumn="80,".join(range(120,999),",")

  autocmd FileType ruby setlocal colorcolumn=100
endfunction

function! RubyStuff()
  " Add 80 characters column highlight
  let &colorcolumn="100,".join(range(120,999),",")

  autocmd FileType ruby setlocal colorcolumn=100
endfunction

function! RustStuff()
  " Add 100 characters column highlight
  let &colorcolumn="100,".join(range(120,999),",")

  autocmd FileType rust setlocal colorcolumn=100 shiftwidth=4 softtabstop=4 tabstop=4
endfunction

call DefaultStuff()
augroup ruby
  autocmd!
  autocmd FileType ruby call RubyStuff()
augroup end
augroup rust
  autocmd!
  autocmd FileType rust call RustStuff()
augroup end

" ======== NERDTree related stuff ========
let g:NERDTreeWinSize=20
let NERDTreeIgnore = ['\.beam']
"the working directory is always the one where the active buffer is located.
"set autochdir
"make sure the working directory is set correctly when changing folders from
"NERDTree
let g:NERDTreeChDirMode=3
let g:NERDTreeUseTCD=3
let NERDTreeMinimalUI = 1
let NERDTreeCustomOpenArgs = {'file': {'reuse': 'currenttab', 'where': 'p', 'keepopen': 1}, 'dir': {}}
"gvim only :/
nmap <C-q> :NERDTreeToggle<CR>
" Open NERDTree on vim startup (only when there is no file on the cli)
function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction
autocmd VimEnter * call StartUp()
autocmd VimLeave * NERDTreeClose

"bind F5 to toggling colorscheme
call togglebg#map("<F6>")

" =========== navigation related stuff ===========
"sane pane navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"navigate through copen using meta-j and meta-k
map <M-j> :cn<CR>
map <M-k> :cp<CR>
"open using meta-o
map <M-o> :copen<CR>
map <M-c> :cclose<CR>

"enable jsx only in .jsx files
let g:jsx_ext_required = 1

"essentially ctrl can also be part of it mapping to Kate/latex favorite shortcut
nmap <C-M-lt> :RustFmt<CR>
nmap <C-M-«> :RustFmt<CR>
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

"some common patterns extracted as shortcuts
fun! s:polite_sub(search, ...) range
    let l:replace = get(a:, 1, '')
    echom mode()
    execute a:firstline . ',' . a:lastline . 's/' . a:search . '/' . l:replace . '/gc'
endfun
command Picks call s:polite_sub("pick", "s")
command -nargs=+ -range=% Repl :<line1>,<line2> call s:polite_sub(<f-args>)

fun! s:global_search(term, ...)
    let l:type = get(a:, 1, expand('%:e'))
    execute ':grep -F "' . a:term . '" **/*.' . l:type
endfun
command -nargs=+ S call s:global_search(<f-args>)

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

set sessionoptions+=curdir,globals,tabpages

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

set ttyfast

"smartcase requires ignorecase
set ignorecase
set smartcase

set switchbuf=useopen

"open last used buffer with backspace in normal mode
nnoremap <BS> <C-^>

fun! s:reload()
  so $MYVIMRC
  Fix
endfun
command! -nargs=0 Reload call s:reload()

nmap =j :%!python -m json.tool<CR>
let g:vrc_response_default_content_type = 'application/json'

command! -nargs=0 Sw w !sudo tee % > /dev/null

let g:airline_symbols_ascii = 1

au FileType gitcommit setlocal tw=70

"vimdiff better colors
let g:solarized_diffmode="high"

" ================ COC stuff ====================
"
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" eliminate the sign column entirely and put the signs into the number column.
set signcolumn=number
