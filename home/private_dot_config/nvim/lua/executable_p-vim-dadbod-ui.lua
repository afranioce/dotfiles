local g = vim.g
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

g.db_ui_use_nerd_fonts = 1
g.completion_matching_ignore_case = true
g.db_ui_win_position = 'right'
g.db_ui_winwidth = '60'
-- g.db_ui_debug = 1

map('n', '<leader>d', ':DBUIToggle<CR>', opts)
