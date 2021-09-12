local g = vim.g
local cmd = vim.cmd

g.minimap_auto_start = 1
g.minimap_auto_start_win_enter = 1
g.minimap_git_colors = 1
g.minimap_block_filetypes = {
  'NvimTree',
  'dbui',
}
g.minimap_close_filetypes = {
  'NeogitStatus',
  'packer',
  'dashboard',
}

cmd [[hi MinimapCurrentLine ctermfg=Green guifg=#50FA7B guibg=#32302f]]

g.minimap_highlight = 'MinimapCurrentLine'
