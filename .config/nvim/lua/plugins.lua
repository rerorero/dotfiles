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
    {
      "shellRaining/hlchunk.nvim",
      event = { "BufReadPre", "BufNewFile" },
      config = function()
        require("plugin-hlchunk")
      end
    },
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
    {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        require("plugin-telescope")
      end,
    },
    -- terraform
    { "hashivim/vim-terraform" },
    -- lualine
    -- need to install Nerd Font https://chaika.hatenablog.com/entry/2019/06/09/090000
    { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons"} },
    -- filer
    -- need to install Nerd Font https://chaika.hatenablog.com/entry/2019/06/09/090000
    { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
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
      dependencies = { "nvim-tree/nvim-web-devicons" },
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
    {
      "yetone/avante.nvim",
      event = "VeryLazy",
      lazy = false,
      version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
      opts = {
        provider = "claude", -- "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
        openai = {
          -- endpoint = "https://api.anthropic.com",
          -- model = "claude-3-5-sonnet-20241022",
          model = "claude-3-7-sonnet-20250219",
          -- temperature = 0,
          -- max_tokens = 4096,
        },
      },
      build = "make",
      dependencies = {
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-treesitter/nvim-treesitter",
        --- The below dependencies are optional,
        "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
        "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
        "ibhagwan/fzf-lua", -- for file_selector provider fzf
        "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
        {
          -- support for image pasting
          "HakonHarnes/img-clip.nvim",
          event = "VeryLazy",
          opts = {
            -- recommended settings
            default = {
              embed_image_as_base64 = false,
              prompt_for_file_name = false,
              drag_and_drop = {
                insert_mode = true,
              },
              -- required for Windows users
              use_absolute_path = true,
            },
          },
        },
        {
          -- Make sure to set this up properly if you have lazy=true
          'MeanderingProgrammer/render-markdown.nvim',
          opts = {
            file_types = { "markdown", "Avante" },
          },
          ft = { "markdown", "Avante" },
        },
      },
    },
    -- startup
    {
      'nvimdev/dashboard-nvim',
      event = 'VimEnter',
      config = function()
        require('dashboard').setup {
          theme = "hyper",
          config = {
            header = require("dashboard-header")
          },
        }
      end,
      dependencies = { {'nvim-tree/nvim-web-devicons'}}
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "gruvbox" } },
  -- automatically check for plugin updates
  checker = {
    enabled = true,
    frequency = 604800, -- 1 week
  },
})
