local key_map = require('mappings')

require("flutter-tools").setup({
  fvm = true,
  lsp = {
    on_attach = function(client, bufnr)
      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
      key_map.lsp_buf_mappings(client, bufnr)
    end
  }
})

