local cmd = vim.cmd
local g = vim.g
local o = vim.o
local map = vim.api.nvim_set_keymap

o.termguicolors = true -- Enable colors properly

require'nvim-tree'.setup{
  nvim_tree_auto_open = true -- Automatically open in directory
}

map('n', '<C-n>', ':NvimTreeToggle<Cr>', {})
map('n', '<leader>n', ':NvimTreeFindFile<Cr>', {})

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

-- g.nvim_tree_bindings = {
--   { key = 'd', cb = tree_cb('remove') },
--   { key = 'm', cb = tree_cb('rename') },
--   { key = 'M', cb = tree_cb('full_rename') },
--   { key = 't', cb = tree_cb('tabnew') },
--   { key = {'<Esc>', '<C-d>', 'q'}, cb = tree_cb('close') },
--   { key = '<BS>', cb = tree_cb('close_node') },
-- }
g.nvim_tree_width = 50
g.nvim_tree_gitignore = 1
g.nvim_tree_auto_ignore_ft = { 'dashboard' } -- Disable auto open tree
g.nvim_tree_quit_on_open = 1 -- Close tree when opening file
g.nvim_tree_indent_markers = 1
-- g.nvim_tree_auto_resize = 1
g.nvim_tree_window_picker_exclude = {
  filetype = {
    'packer',
    'dashboard',
    'minimap'
  }
}
g.nvim_tree_show_icons = { -- Icons
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 0,
  indent_markers = 1,
}
g.nvim_tree_ignore = { -- Hide folders
  '.git',
  '.idea',
}

-- Colors
cmd [[highlight NvimTreeFolderIcon ctermfg=blue]]
cmd [[highlight NvimTreeGitDirty ctermfg=green]]
cmd [[highlight NvimTreeGitStaged ctermfg=yellow]]
cmd [[highlight NvimTreeGitNew ctermfg=blue]]

