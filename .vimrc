""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundle 'scrooloose/nerdtree'

NeoBundle 'Townk/vim-autoclose'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
""""""""""""""""""""""""""""""




colors molokai
syntax on

set directory=$HOME/vimtmp
set backupdir=$HOME/vimbackup
set clipboard=unnamed
set number
set hidden
set incsearch
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab
set autoindent
set smartindent
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set whichwrap=b,s,h,l,<,>,[,]
set showmatch
set smartcase
set nowrapscan
set grepprg=grep\ -nH

autocmd FileType php set tags=$HOME/.vim/tags/ceweb_temp.tags
nmap bb :ls<CR>:buf
noremap ; :
noremap : ;


