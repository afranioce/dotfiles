local map = vim.api.nvim_set_keymap
local g = vim.g

g.symbols_outline = {
  width = 50
}

map('n', '<F4>', ':SymbolsOutline<Cr>', {})
