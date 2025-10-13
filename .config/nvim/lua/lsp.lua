require("mason").setup()
local lsp_installer = require("mason-lspconfig")
local key_map = require('mappings')
local util = require "lspconfig/util"

lsp_installer.setup({
  ensure_installed = {
    "gopls",
    "eslint",
    "golangci_lint_ls",
    "pyright",
    "ts_ls",
    "terraformls",
    "sorbet",
    "solargraph",
    "vue_ls",
  },
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
    -- root_dir = util.root_pattern("go.work", "go.mod", ".git"),
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
      venvPath = ".",
      pythonPath = "./.venv/bin/python",
    }
  },

  terraformls = {},

  -- ruby
  sorbet = {
    cmd = { 'srb', 'tc', '--lsp', '--dir', '.' },
  },
  solargraph = {},

  -- typescript
  ts_ls = {
    init_options = {
      plugins = {
        {
          name = "@vue/typescript-plugin",
          location = "",
          languages = { "vue" },
        }
      }
    },
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
  },
  eslint = {},

  -- "rust_analyzer"
  
  -- mac/ios
  sourcekit = {},

  -- vue
  vue_ls = {}
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

for lsp, conf in pairs(servers) do
  conf.on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    key_map.lsp_buf_mappings(client, bufnr)
  end

  conf.capabilities = capabilities

  vim.lsp.config(lsp, conf)
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
