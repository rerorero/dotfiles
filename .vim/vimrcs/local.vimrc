if &compatible
  set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/bundle')
  call dein#begin('~/.vim/bundle')
  call dein#add('~/.vim/bundle/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('fatih/vim-go')
  call dein#add('autozimu/LanguageClient-neovim', { 'build': 'bash install.sh', 'rev': 'next' })
  call dein#add('preservim/nerdtree')
  call dein#add('kana/vim-submode')
  call dein#add('buoto/gotests-vim')
  call dein#add('Yggdroot/indentLine')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

""if dein#check_install()
""  call dein#install()
""endif

filetype plugin indent on
syntax enable

""""""""""""""""""""""""""""""
" Denite.nvim
""""""""""""""""""""""""""""""
nmap <silent> ,f :<C-u>Denite file/rec<CR>
nmap <silent> ,b :<C-u>Denite buffer<CR>
nmap <silent> ,l :<C-u>Denite line<CR>

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  " 一つ上のディレクトリを開き直す
  inoremap <silent><buffer><expr> <BS> denite#do_map('move_up_path')
  " imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
  " Deniteを閉じる
  inoremap <silent><buffer><expr> <C-c> denite#do_map('quit')
  nnoremap <silent><buffer><expr> <C-c> denite#do_map('quit')
endfunction

" configure grep
nnoremap [grep] <Nop>
nmap ,g [grep]
nmap <silent> [grep]g :<C-u>Denite grep -buffer-name=grep-default-buf<CR>
nmap <silent> [grep]r :<C-u>Denite -resume -buffer-name=grep-default-buf<CR>
nmap <silent> [grep]n :<C-u>Denite -resume -buffer-name=grep-default-buf -cursor-pos=+1 -immediately<CR>
nmap <silent> [grep]m :<C-u>Denite -resume -buffer-name=grep-default-buf -cursor-pos=-1 -immediately<CR>
let s:ignore_globs = ['.git', '.idea', 'node_modules']
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('file_rec', 'command', [
      \ 'ag',
      \ '--follow',
      \ ] + map(deepcopy(s:ignore_globs), { k, v -> '--ignore=' . v }) + [
      \ '--nocolor',
      \ '--nogroup',
      \ '-g',
      \ ''
      \ ])
" call denite#custom#source('file/rec', 'matchers', ['matcher/substring'])
" call denite#custom#filter('matcher/ignore_globs', 'ignore_globs', s:ignore_globs)

" Change default action.
""call denite#custom#kind('file', 'default_action', 'split')

""""""""""""""""""""""""""""""
" deoplete.vim
""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
set completeopt+=noinsert
call deoplete#custom#option('auto_complete_delay', 200)

""""""""""""""""""""""""""""""
" golang
""""""""""""""""""""""""""""""
""letc g:go_debug = ['shell-commands']
" 保存時に必要なimportを自動的に挿入
let g:go_fmt_command = "goimports"
let g:go_fmt_options = {
\ 'goimports': '-local github.com/kouzoh',
\ }
" LSPに任せる機能をOFFにする
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_rename_command = 'gopls'

let g:go_list_type = "quickfix"

" run / test
autocmd FileType go nnoremap <buffer>gb :<C-u>GoBuild<CR>
" autocmd FileType go nnoremap <buffer>gr :<C-u>GoReferrers<CR> replaced with coc
autocmd FileType go nnoremap <buffer>gt :<C-u>GoTestFunc<CR>
" autocmd FileType go nnoremap <buffer>gn :<C-u>GoRename<Space> replaced with coc
""autocmd FileType go nnoremap <buffer>gi :<C-u>GoInfo<CR> " replaced with coc
autocmd FileType go nnoremap <buffer>gf :<C-u>GoFillStruct<CR>
autocmd FileType go nnoremap <buffer><C-a> :<C-u>GoAlternate<CR>
""autocmd FileType go nnoremap <buffer>gd :<C-u>GoDef<CR> " replaced with coc

let g:gotests_bin = '/Users/rerorero/go/bin/gotests'

""""""""""""""""""""""""""""""
" Language Server
""""""""""""""""""""""""""""""
set hidden
let g:LanguageClient_serverCommands = {
    \ 'go': ['gopls']
    \ }
let g:LanguageClient_loadSettings = 1
"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>

""""""""""""""""""""""""""""""
" coc.nvim
""""""""""""""""""""""""""""""
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion. TODO: map something else
" inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <silent> gn <Plug>(coc-rename)
" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>d  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>n  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>m  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>r  :<C-u>CocListResume<CR>

""""""""""""""""""""""""""""""
" タブと分割
""""""""""""""""""""""""""""""
nnoremap sb :<C-u>Denite buffer -buffer-name=file<CR>

call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

""""""""""""""""""""""""""""""
" indent
""""""""""""""""""""""""""""""
let g:indentLine_color_term =239
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '¦'

""""""""""""""""""""""""""""""
" nerdtree
""""""""""""""""""""""""""""""
nnoremap <C-f> :NERDTreeToggle<CR>
" 隠しファイルをデフォルトで表示させる
let NERDTreeShowHidden = 1
nnoremap <silent> ,tt :TagbarToggle<CR>

""""""""""""""""""""""""""""""
" ctrlp
""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }


""""""""""""""""""""""""""""""
" json
""""""""""""""""""""""""""""""
autocmd FileType json syntax match Comment +\/\/.\+$+

""""""""""""""""""""""""""""""
" etc
""""""""""""""""""""""""""""""
" karoiyaでundoファイル使わない
:set noundofile

" clipboard
set clipboard=unnamed,autoselect

set conceallevel=0
let g:vim_json_syntax_conceal = 0

set backspace=indent,eol,start

"terraform
let g:terraform_fmt_on_save = 1


" quickfix
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>

nnoremap <silent>,t :term<CR>

" easy-motion <Leader>f{char} to move to {char}
" map <silent> ,f <Plug>(easymotion-bd-f)
" nmap <silent> ,f <Plug>(easymotion-overwin-f)

" copy file path
nmap ,cf :let @*=expand("%:p")<CR>
