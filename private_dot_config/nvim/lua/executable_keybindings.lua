local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- Copy/yank file paths
map('n', 'cp', ':let @*=expand("%")<CR>', opts)
map('n', 'cP', ':let @*=expand("%:p")<CR>', opts)
map('n', 'yp', ':let @"=expand("%")<CR>', opts)
map('n', 'yP', ':let @"=expand("%:p")<CR>', opts)

-- Switching windows
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('n', '<C-h>', '<C-w>h', opts)

-- Close buffer
map('n', '<leader>c', ':bd<CR>', opts)
map('n', '<leader>C', ':bd!<CR>', opts) -- Force close

-- Clean search (highlight)
map('n', '<leader><space>', ':noh<CR>', opts)

-- Save buffer
map('n', '<C-s>', ':w<CR>', opts)

-- Split
map('n', '<leader>h', ':<C-u>split<CR>', opts)
map('n', '<leader>v', ':<C-u>vsplit<CR>', opts)

-- Spell check toggle
map('n', '<leader>sc', ':set spell!<CR>', opts)

-- maintain Visual Mode after shifting > and <
map('n', '<', '<<', opts)
map('n', '>', '>>', opts)
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)
