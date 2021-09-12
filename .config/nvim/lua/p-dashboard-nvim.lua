local g = vim.g
local map = vim.api.nvim_set_keymap

map('n', '<Leader>ss', ':<C-u>SessionSave<CR>', {})
map('n', '<Leader>sl', ':<C-u>SessionLoad<CR>', {})

g.dashboard_default_executive = 'telescope'
