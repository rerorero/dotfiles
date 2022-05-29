-- ref. https://kien.github.io/ctrlp.vim/

vim.g.ctrlp_map = '<c-p>'
vim.g.ctrlp_cmd = 'CtrlP'

-- 'c' - the directory of the current file.
-- 'r' - the nearest ancestor that contains one of these directories or files: .git .hg .svn .bzr _darcs, and your own root markers defined with the g:ctrlp_root_markers option.
-- 'a' - like 'c', but only applies when the current working directory outside of CtrlP isn't a direct ancestor of the directory of the current file.
vim.g.ctrlp_working_path_mode = 'ra'

vim.cmd([[
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|target)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
]])
