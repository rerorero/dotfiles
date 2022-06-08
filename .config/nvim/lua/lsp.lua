local lsp_installer = require("nvim-lsp-installer")
local lspconf = require('lspconfig')
local key_map = require('mappings')
local util = require "lspconfig/util"

lsp_installer.setup({
  automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
})

-- for pyright with virtualenv
local virtual_env_dirctory = vim.trim(vim.fn.system('poetry env info -p'))
local python_path = 'python'
-- Check if there is a vertial env path in current dir
if #vim.split(virtual_env_dirctory, '\n') == 1 then
  python_path = string.format("%s/bin/python", virtual_env_dirctory)
end

-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = {
  -- "bashls",
  -- "eslint",
  golangci_lint_ls = {},

  gopls = {
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
        completeUnimported = true,
        usePlaceholders = true,
      },
    },
  },

  pyright = {
    python = {
      pythonPath = python_path;
    }
  },

  terraformls = {},

  -- ruby
  solargraph = {},
  sorbet = {},

  -- "tsserver",
  -- "rust_analyzer"
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

for lsp, conf in pairs(servers) do
  conf.on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    key_map.lsp_buf_mappings(client, bufnr)
  end

  conf.capabilities = capabilities

  lspconf[lsp].setup(conf)
end

-- diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = false,
    underline = true,
    update_in_insert = false,
    virtual_text = false
  }
)
