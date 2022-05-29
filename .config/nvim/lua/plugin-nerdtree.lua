-- show hidden file
vim.api.nvim_command('let NERDTreeShowHidden=1')

-- jump to current file
vim.api.nvim_create_user_command('NF', 'NERDTreeFind', {})
