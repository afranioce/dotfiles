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
  use {
    'dracula/vim',
    config = function()
      vim.cmd [[syntax on]]
      vim.cmd [[set t_Co=256]]
      -- vim.cmd [[set cursorline]]
      vim.cmd [[colorscheme dracula]]
    end,
  }

  -- use {
  --   'morhetz/gruvbox',
  --   config = function()
  --     vim.cmd [[syntax on]]
  --     vim.cmd [[set t_Co=256]]
  --     vim.cmd [[set cursorline]]
  --     vim.cmd [[colorscheme gruvbox]]
  --     vim.cmd [[set background=dark]]
  --   end,

  -- use {
  --   'kunzaatko/nord.nvim',
  --   config = function()
  --     vim.cmd [[colorscheme nord]]
  --   end,
  -- }

  -- use {
  --   'sonph/onehalf',
  --   rtp = 'vim',
  --   config = function()
  --     vim.cmd [[syntax on]]
  --     vim.cmd [[set t_Co=256]]
  --     vim.cmd [[set cursorline]]
  --     vim.cmd [[colorscheme onehalfdark]]


  -- use {
  --   'shaunsingh/nord.nvim',
  --   config = function()
  --     vim.g.nord_borders = true
  --
  --       require('nord').set()
  --   end,
  -- }

  -- Package manager
  use 'wbthomason/packer.nvim'

  use 'justinmk/vim-sneak'
  use 'kyazdani42/nvim-web-devicons'
  use 'editorconfig/editorconfig-vim'
--  use {
--    'wfxr/minimap.vim',
--    config = [[require('p-minimap')]]
--  }

--   use {
--     'simrat39/symbols-outline.nvim',
--     config = [[require('p-nvim-symbols-outline')]]
--   }
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
    'numToStr/Comment.nvim',
    config = [[require('p-nvim-comment')]],
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
    'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-nvim-lsp-document-symbol' },
      { 'hrsh7th/cmp-nvim-lsp-signature-help' },
      { 'kristijanhusak/vim-dadbod-completion' },
      { 'quangnguyen30192/cmp-nvim-ultisnips' },
    },
    config = [[require('p-nvim-cmp')]],
  }

  use {
    'SirVer/ultisnips',
    requires = {
      { 'honza/vim-snippets', rtp = '.' },
    },
    config = function()
      vim.g.UltiSnipsExpandTrigger = '<Plug>(ultisnips_expand)'
      vim.g.UltiSnipsJumpForwardTrigger = '<Plug>(ultisnips_jump_forward)'
      vim.g.UltiSnipsJumpBackwardTrigger = '<Plug>(ultisnips_jump_backward)'
      vim.g.UltiSnipsListSnippets = '<c-x><c-s>'
      vim.g.UltiSnipsRemoveSelectModeMappings = 0
    end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-project.nvim'}
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
