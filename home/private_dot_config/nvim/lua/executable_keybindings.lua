local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- Copy/yank file paths
map('n', 'cp', ':let @*=expand("%")<CR>', opts)
map('n', 'cP', ':let @*=expand("%:p")<CR>', opts)
map('n', 'yp', ':let @"=expand("%")<CR>', opts)
map('n', 'yP', ':let @"=expand("%:p")<CR>', opts)

-- Switching windows alt + hjkl
map("n", "<A-h>", "<C-w>h", opts)
map("n", "<A-j>", "<C-w>j", opts)
map("n", "<A-k>", "<C-w>k", opts)
map("n", "<A-l>", "<C-w>l", opts)

-- Close buffer
map('n', '<leader>c', ':bd<CR>', opts)
map('n', '<leader>C', ':bd!<CR>', opts) -- Force close

-- Clean search (highlight)
map('n', '<leader><space>', ':noh<CR>', opts)

-- Save buffer
map('n', '<C-s>', ':w<CR>', opts)

-- Split screen
map("n", "s", "", opts)
map("n", "sv", ":vsp<CR>", opts) -- Opven vertital
map("n", "sh", ":sp<CR>", opts) -- Open horizontal
map("n", "sc", "<C-w>c", opts) -- Close current
map("n", "so", "<C-w>o", opts) -- close others

-- Left and right proportional control
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)
map("n", "s,", ":vertical resize -10<CR>", opts)
map("n", "s.", ":vertical resize +10<CR>", opts)

-- Up and down ratio
map("n", "sj", ":resize +10<CR>", opts)
map("n", "sk", ":resize -10<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Up>", ":resize -2<CR>", opts)

map("n", "s=", "<C-w>=", opts) -- Equal proportion

-- Spell check toggle
map('n', '<leader>sc', ':set spell!<CR>', opts)

-- maintain Visual Mode after shifting > and <
map('n', '<', '<<', opts)
map('n', '>', '>>', opts)
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- Move selected text up and down
map("v", "J", ":move '>+1<CR>gv-gv", opts)
map("v", "K", ":move '<-2<CR>gv-gv", opts)

-- magic search
map("n", "/", "/\\v", { noremap = true, silent = false })
map("v", "/", "/\\v", { noremap = true, silent = false })
