local mappings = require('mappings')
local gotest_cmd = 'go test'

-- tab
vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = false


-- vim-go
vim.g.go_fmt_command = "goimports"

-- avoid key map conflict with gopls
vim.g.go_def_mapping_enabled = 0
vim.g.go_doc_keywordprg_enabled = 0
vim.g.go_def_mode='gopls'
vim.g.go_info_mode='gopls'
vim.g.go_rename_command = 'gopls'
vim.g.go_list_type = "quickfix"

-- key map for go file
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'go',
  callback = mappings.mappings_go,
})

-- GoUnitTest runs go test the function where the cunnrent cursor is on
-- depends on :Ttoggle (neoterm)

vim.api.nvim_create_user_command('GoUnitTest', function()
  local test = vim.fn.search([[func \(Test\|Example\)]], "bcnW")
  if (test == 0) then
    print("vim-go: [debug] no test found immediate to cursor")
    return
  end
  -- run via termnial
  local line = vim.fn.getline(test)
  local parsed1 = vim.split(line, ' ', { plain = true })[2]
  local name = vim.split(parsed1, '(', { plain = true })[1]
  local filepath = vim.fn.expand('%:p:h')
  local cmd = ':T ' .. gotest_cmd .. ' -run ' .. name .. '$ ' .. filepath .. ' -v -count 1'
  vim.cmd(cmd)
  vim.cmd(':Ttoggle')
end, { nargs = 0 })
