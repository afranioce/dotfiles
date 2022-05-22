local map = vim.api.nvim_set_keymap

require('Comment').setup()

map("n", "<C-_>", "gcc", { noremap = false })
map("v", "<C-_>", "gcc", { noremap = false })
