local cmd = vim.cmd
local g = vim.g
local o = vim.o
local map = vim.api.nvim_set_keymap

o.termguicolors = true -- Enable colors properly

require'nvim-tree'.setup{
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  git = {
    enable = true,
    ignore = true,
  },
  ignore_ft_on_setup = {
    'dashboard'
  },
  view = {
    side = 'left',
    width = 60
  },
  filters = {
    dotfiles = false,
    custom = {
      '.git',
      '.idea',
    },
  },
}

map('n', '<C-n>', ':NvimTreeToggle<Cr>', {})
map('n', '<leader>n', ':NvimTreeFindFile<Cr>', {})

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

g.nvim_tree_quit_on_open = 1 -- Close tree when opening file
g.nvim_tree_indent_markers = 1
-- g.nvim_tree_auto_resize = 1
g.nvim_tree_show_icons = { -- Icons
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 0,
  indent_markers = 1,
}

-- Colors
cmd [[highlight NvimTreeFolderIcon ctermfg=blue]]
cmd [[highlight NvimTreeGitDirty ctermfg=green]]
cmd [[highlight NvimTreeGitStaged ctermfg=yellow]]
cmd [[highlight NvimTreeGitNew ctermfg=blue]]

