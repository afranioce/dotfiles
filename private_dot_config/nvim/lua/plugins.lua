local cmd = vim.cmd
local execute = vim.api.nvim_command
local fn = vim.fn

-- Bootstrapping
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- Start
cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

-- Load Plugins
return require('packer').startup(function()
  -- Theme
  use 'dracula/vim'
  -- Package manager
  use 'wbthomason/packer.nvim'

  use 'justinmk/vim-sneak'
  use 'kyazdani42/nvim-web-devicons'
  use 'ray-x/lsp_signature.nvim'
  use 'editorconfig/editorconfig-vim'
--  use {
--    'wfxr/minimap.vim',
--    config = [[require('p-minimap')]]
--  }

  use {
   'akinsho/toggleterm.nvim',
   config = [[require('p-nvim-toggleterm')]]
  }

--  use {
--   'kdheepak/lazygit.nvim',
--   config = [[require('p-lazygit')]]
--  }

  use {
    'antoinemadec/FixCursorHold.nvim', --remove after close https://github.com/neovim/neovim/issues/12587
    config = [[vim.g.cursorhold_updatetime = 700]]
  }

  use {
    'onsails/lspkind-nvim',
    config = [[require('p-nvim-lspkind')]],
  }

  use {
    'b3nj5m1n/kommentary',
    config = [[require('p-kommentary')]],
  }

  use {
    'mfussenegger/nvim-dap',
    config = [[require('p-nvim-dap')]],
  }

  use {
    'windwp/nvim-autopairs',
    config = [[require('p-nvim-autopairs')]],
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = [[require('p-nvim-indent-blankline')]],
  }

  use {
    'theHamsta/nvim-dap-virtual-text',
    requires = {
      { 'mfussenegger/nvim-dap' },
    },
    config = [[require('p-nvim-dap-virtual-text')]],
  }

  use {
    'rcarriga/nvim-dap-ui',
    requires = {
      { 'mfussenegger/nvim-dap' },
    },
    config = [[require('p-nvim-dap-ui')]],
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
    },
    config = [[require('p-gitsigns')]],
  }

  use {
    'kristijanhusak/vim-dadbod-ui',
    requires = {
      { 'tpope/vim-dadbod' },
      { 'kristijanhusak/vim-dadbod-completion' },
    },
    config = [[require('p-vim-dadbod-ui')]],
  }

  use {
    'glepnir/dashboard-nvim',
    config = [[require('p-dashboard-nvim')]],
  }

  use {
    'neovim/nvim-lspconfig',
    requires = {
      { 'ray-x/lsp_signature.nvim' },
    },
    config = [[require('p-nvim-lspconfig')]],
  }

  use {
    'williamboman/nvim-lsp-installer',
    requires = {
      { 'neovim/nvim-lspconfig' },
    },
    config = [[require('p-nvim-lsp-installer')]],
  }

-- Disabled because I'm using the lazygit
--  use {
--    'sindrets/diffview.nvim',
--    requires = {
--      { 'kyazdani42/nvim-web-devicons' },
--    },
--    config = [[require('p-nvim-diffview')]],
--  }
--
--  use {
--    'TimUntersberger/neogit',
--    requires = {
--      { 'nvim-lua/plenary.nvim' },
--      { 'sindrets/diffview.nvim' }
--    },
--    config = [[require('p-neogit')]]
--  }

  use {
    'akinsho/nvim-bufferline.lua',
    requires = {
      { 'kyazdani42/nvim-web-devicons' },
    },
    config = [[require('p-nvim-bufferline')]],
  }

  use {
    'L3MON4D3/LuaSnip',
    requires = {
      { 'rafamadriz/friendly-snippets' },
    },
    config = [[require'luasnip/loaders/from_vscode'.load()]]
  }

--  use {
--    'hrsh7th/nvim-compe',
--    requires = {
--      { 'L3MON4D3/LuaSnip' },
--    },
--    config = [[require('p-nvim-compe')]],
--  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-buffer' },
      { 'onsails/lspkind-nvim' },
      { 'kristijanhusak/vim-dadbod-completion' },
    },
    config = [[require('p-nvim-cmp')]],
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
    },
    config = [[require('p-telescope')]],
  }

  use {
    'hoob3rt/lualine.nvim',
    requires = {
      { 'kyazdani42/nvim-web-devicons' },
      { 'arkav/lualine-lsp-progress' },
    },
    config = [[require('p-lualine')]],
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = [[require('p-nvim-treesitter')]],
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'kyazdani42/nvim-web-devicons' },
    },
    config = [[require('p-nvim-tree')]],
  }

end)
