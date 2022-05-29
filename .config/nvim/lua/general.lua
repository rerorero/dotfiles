local opt = vim.api.nvim_set_option
local cmd = vim.api.nvim_command

-- encoding
opt('encoding', 'utf-8')
opt('fileencodings', 'ucs-boms,utf-8,euc-jp,cp932')
cmd('lang en_US.UTF-8')
opt('ambiwidth', 'double') -- for Japanese

-- search
cmd('set incsearch') -- enable incremental search
cmd('set noignorecase')
cmd('set smartcase')

-- indent
cmd('set tabstop=4')
cmd('set shiftwidth=2')
cmd('set expandtab') -- space tab
cmd('set smarttab')
cmd('set smartindent')
cmd('set autoindent')

-- search
cmd('set hlsearch') -- hilight the result
cmd('set nowrapscan') -- don't return top at the end
opt('grepprg', [[grep\ -nH]])
cmd('set wildignore+=*/tmp/*,*.so,*.swp,*.zip') -- ignore binary file

-- show invisible chars
cmd('set list')

-- cursor line
cmd('set nocursorline') -- do not highlight cursor line
opt('listchars', [[tab:» ,eol:↲,extends:»,precedes:«,nbsp:%]])
vim.api.nvim_create_autocmd({'InsertEnter','InsertLeave'}, { -- toggle cursorline when insert mode
  pattern = '*',
  callback = function()
    cmd('set cursorline!')
  end,
})

-- enable backspace deletes eol
opt('backspace', 'indent,eol,start')

-- highlight pair
cmd('set showmatch')
opt('matchtime', 1)

-- popup
opt('pumheight', 10) -- popup height

-- status line
-- TODO: use lualine
opt('statusline', [[%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P]])

-- share clipboard
opt('clipboard', 'unnamedplus')

cmd('set number') -- show line number
opt('display', 'lastline') -- show long line

-- suppress error when switching buffer
cmd('set hidden')

-- move to next line
cmd('set whichwrap=b,s,h,l,<,>,[,]')

-- complete filename
cmd('set wildmenu')

-- history
opt('history', 1000)

-- completion
opt('completeopt', 'menu,menuone,noselect')
