require('mappings').mappings_ruby()

-- tab
vim.bo.tabstop = 2
vim.bo.softtabstop = 2
vim.bo.shiftwidth = 2
vim.bo.expandtab = true


-- local snr = {noremap = true, silent = true}
-- local bmap = vim.api.nvim_buf_set_keymap
-- bmap(0, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', snr)
