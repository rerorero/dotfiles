-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- color scheme
    { "ellisonleao/gruvbox.nvim" },
    -- comment multi lines (C--)
    { "tomtom/tcomment_vim" },
    -- modify split size
    { "kana/vim-submode" },
    -- show vertical lines at each indentation level
    { "Yggdroot/indentLine" },
    -- resuable terminal
    { "kassio/neoterm" },
    -- The lightning fast fzf fuzzy finder
    { "junegunn/fzf", build = "./install --all" },
    { "junegunn/fzf.vim" },
    -- easy motion
    { "easymotion/vim-easymotion" },
    -- Prettier formatter
    { "prettier/vim-prettier" },
    -- telescope
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    -- terraform
    { "hashivim/vim-terraform" },
    -- lualine
    -- need to install Nerd Font https://chaika.hatenablog.com/entry/2019/06/09/090000
    { "nvim-lualine/lualine.nvim", dependencies = { "kyazdani42/nvim-web-devicons"} },
    -- filer
    -- need to install Nerd Font https://chaika.hatenablog.com/entry/2019/06/09/090000
    { "kyazdani42/nvim-tree.lua", dependencies = { "kyazdani42/nvim-web-devicons" } },
    -- surround
    { "machakann/vim-sandwich" },
    -- editorconfig
    { "gpanders/editorconfig.nvim" },
    -- LSP installer
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    -- Easy LSP configuration
    { "neovim/nvim-lspconfig" },
    -- go plugin besides lsp (gopls)
    { "fatih/vim-go" },
    -- show lsp progress
    { "j-hui/fidget.nvim" },
    -- show symboles
    { "simrat39/symbols-outline.nvim" },
    -- show all problems
    {
      "folke/trouble.nvim",
      dependencies = { "kyazdani42/nvim-web-devicons" },
      config = function()
        require("trouble").setup {}
      end
    },
    -- test for Ruby
    { "vim-test/vim-test" },
    -- completion
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/nvim-cmp" },
    -- snipets
    { "SirVer/ultisnips" },
    { "quangnguyen30192/cmp-nvim-ultisnips" },
    -- copilot
    { "github/copilot.vim" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "gruvbox" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- local fn = vim.fn
-- local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
-- if fn.empty(fn.glob(install_path)) > 0 then
--   packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
-- end
--
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--   augroup end
-- ]])
--
-- return require('packer').startup(function(use)
--   use 'wbthomason/packer.nvim' -- Packer can manage itself
--   use { "ellisonleao/gruvbox.nvim" }
--   use 'tomtom/tcomment_vim' -- comment multi lines (C--)
--   use 'kana/vim-submode' -- modify split size
--   use 'Yggdroot/indentLine' -- show vertical lines at each indentation level
--   use 'kassio/neoterm' -- resuable terminal
--   use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' } -- Install the fzf binary
--   use 'junegunn/fzf.vim' -- The lightning fast fzf fuzzy finder
--   use 'easymotion/vim-easymotion'
--   use 'prettier/vim-prettier' -- Prettier formatter
--   use 'jjo/vim-cue' -- cue highlight
--   use {
--     'nvim-telescope/telescope.nvim',
--     requires = { {'nvim-lua/plenary.nvim'} }
--   }
--   use 'hashivim/vim-terraform'
--   use {
--     'nvim-lualine/lualine.nvim',
--     -- need to install Nerd Font https://chaika.hatenablog.com/entry/2019/06/09/090000
--     requires = { 'kyazdani42/nvim-web-devicons', opt = true }
--   }
--   use {
--       'kyazdani42/nvim-tree.lua', -- filer
--       -- need to install Nerd Font https://chaika.hatenablog.com/entry/2019/06/09/090000
--       requires = {'kyazdani42/nvim-web-devicons'},
--       tag = 'nightly' -- optional, updated every week. (see issue #1193)
--   }
--   use 'machakann/vim-sandwich' -- surround
--   use 'gpanders/editorconfig.nvim' -- editorconfig
--   -- lsp
--   use 'williamboman/mason.nvim' -- LSP installer
--   use 'williamboman/mason-lspconfig.nvim' -- LSP installer
--   use 'neovim/nvim-lspconfig' -- Easy LSP configuration
--   use 'fatih/vim-go' -- go plugin besides lsp (gopls)
--   use 'j-hui/fidget.nvim' -- show lsp progress
--   use 'simrat39/symbols-outline.nvim' -- show symboles
--   use {
--     'folke/trouble.nvim',
--     requires = "kyazdani42/nvim-web-devicons",
--     config = function()
--       require("trouble").setup {}
--     end
--   } -- show all problems
--   use 'vim-test/vim-test' -- test for Ruby
--   -- completion
--   use 'hrsh7th/cmp-nvim-lsp'
--   use 'hrsh7th/cmp-buffer'
--   use 'hrsh7th/cmp-path'
--   use 'hrsh7th/cmp-cmdline'
--   use 'hrsh7th/nvim-cmp'
--   -- snipets
--   use 'SirVer/ultisnips'
--   use 'quangnguyen30192/cmp-nvim-ultisnips'
--
--   -- copilot
--   use 'github/copilot.vim'
--
--   -- To install a new plugin, do PackerUpdate
--   
--   -- Automatically set up your configuration after cloning packer.nvim
--   -- Put this at the end after all plugins
--   if packer_bootstrap then
--     require('packer').sync()
--   end
-- end)
