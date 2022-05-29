
-- automatically apply
vim.api.nvim_create_autocmd({'BufWritePre'}, {
  pattern = {'*.js', '*.ts', '*.vue', '*.css', '*.scss', '*.json', '*.md'},
  callback = function()
    cmd('PrettierAsync')
  end,
})

