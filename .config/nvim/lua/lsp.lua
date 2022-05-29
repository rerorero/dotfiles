local lsp_installer = require("nvim-lsp-installer")
local lspconf = require('lspconfig')
local key_map = require('mappings')
local util = require "lspconfig/util"

lsp_installer.setup({
  automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
})

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

    -- "terraformls",
    -- "tsserver",
    -- "solargraph", -- ruby
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

  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  lspconf[lsp].setup(conf)
end
