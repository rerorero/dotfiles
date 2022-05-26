syntax on
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set ambiwidth=double

set directory=$HOME/vimtmp
set backupdir=$HOME/vimbackup
set clipboard+=unnamed
set number
set hidden
set incsearch
set tabstop=4
set smarttab
set smartindent
set autoindent
set list
set listchars=tab:»\ ,eol:↲,extends:»,precedes:«,nbsp:%
set whichwrap=b,s,h,l,<,>,[,]
set noignorecase
set smartcase
set hlsearch
set nowrapscan
set grepprg=grep\ -nH

" use gruvbox
" hi SpecialKey ctermfg=239
" hi NonText ctermfg=239
" hi Pmenu      ctermfg=7   ctermbg=238 
" hi PmenuSel   ctermfg=0     ctermbg=186  

" タブ幅
set shiftwidth=2
set expandtab
au BufRead,BufNewFile *.php set tabstop=4 shiftwidth=4 filetype=php

" tabpage
nnoremap <silent> tf :<c-u>tabfirst<cr>
nnoremap <silent> tl :<c-u>tablast<cr>
nnoremap <silent> tn :<c-u>tabnext<cr>
nnoremap <silent> tN :<c-u>tabNext<cr>
nnoremap <silent> tp :<c-u>tabprevious<cr>
nnoremap <silent> te :<c-u>tabedit<cr>
nnoremap <silent> tv :<c-u>tabedit<cr>
nnoremap <silent> tc :<c-u>tabclose<cr>
" nnoremap <silent> <leader>to :<c-u>tabonly<cr>
nnoremap <silent> <leader>ts :<c-u>tabs<cr>

" ヤンクの内容をぺーすとする
nnoremap <silent> yp "0p
nnoremap <silent> yP "0P

" mac用カーソル移動
nnoremap <C-a> 0
nnoremap <C-e> $

"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
   
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

" カーソル行を強調表示しない
set nocursorline
" 挿入モードの時のみ、カーソル行をハイライトする
autocmd InsertEnter,InsertLeave * set cursorline!
" highlight CursorLine cterm=NONE ctermfg=white ctermbg=gray

""""""""""""""""""""""""""""""
" タブと分割
""""""""""""""""""""""""""""""
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>

""""""""""""""""""""""""""""""
" auto closing brackets
""""""""""""""""""""""""""""""
" inoremap { {}<LEFT>
" inoremap [ []<LEFT>
" inoremap ( ()<LEFT>
" inoremap " ""<LEFT>
" inoremap ' ''<LEFT>
" inoremap {<Enter> {}<Left><CR><ESC><S-o>
" inoremap [<Enter> []<Left><CR><ESC><S-o>
" inoremap (<Enter> ()<Left><CR><ESC><S-o>
" vnoremap { "zdi{<C-R>z}<ESC>
" vnoremap [ "zdi[<C-R>z]<ESC>
" vnoremap ( "zdi(<C-R>z)<ESC>
" vnoremap " "zdi"<C-R>z"<ESC>
" vnoremap ' "zdi'<C-R>z'<ESC>

" US keyboard
"noremap ; :
"noremap : ;

" remap Y
nmap Y y$

" 長い行を表示
set display=lastline

" ポップアップ高さ
set pumheight=10

" 対応括弧の表示と速度
set showmatch
set matchtime=1

" インクリメント・デクリメント
nnoremap + <C-a>
nnoremap - <C-x>


" for Go lang
" "let g:gofmt_command = 'goimports'
" Go に付属の plugin と gocode を有効にする
" set rtp+=/usr/local/go/misc/vim
" set rtp+=${GOPATH}/src/github.com/nsf/gocode/vim
" 保存時に :Fmt する
""au FileType go setlocal sw=4 ts=4 sts=4 noet
"au BufWritePre *.go Fmt 
" au FileType go compiler go

"xml format
command! Xml :%s/></>\r</g | filetype indent on | setf xml | normal gg=G

" コマンドの補完
set wildmenu
set history=1000

" mouse
if !has('nvim') && has('mouse')
  set mouse=a
  if has('mouse_sgr')
    set ttymouse=sgr
  elseif v:version > 703 || v:version is 703 && has('patch632')
    set ttymouse=sgr
  else
    set ttymouse=xterm2
  endif
endif

set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

