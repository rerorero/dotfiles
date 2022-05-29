-- key mappings of resizing splits
vim.fn['submode#enter_with']('bufmove', 'n', '', 's>', '<C-w>>')
vim.fn['submode#enter_with']('bufmove', 'n', '', 's<', '<C-w><')
vim.fn['submode#enter_with']('bufmove', 'n', '', 's+', '<C-w>+')
vim.fn['submode#enter_with']('bufmove', 'n', '', 's-', '<C-w>-')
vim.fn['submode#map']('bufmove', 'n', '', '>', '<C-w>>')
vim.fn['submode#map']('bufmove', 'n', '', '<', '<C-w><')
vim.fn['submode#map']('bufmove', 'n', '', '+', '<C-w>+')
vim.fn['submode#map']('bufmove', 'n', '', '-', '<C-w>-')
