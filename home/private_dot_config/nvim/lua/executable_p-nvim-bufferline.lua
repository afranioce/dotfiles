local o = vim.o
local map = vim.api.nvim_set_keymap

o.termguicolors = true -- Enable colors properly

local opt = {
  noremap = true,
  silent = true,
}

require'bufferline'.setup {
  options = {
    diagnostics = 'nvim_lsp',
    separator_style = 'slant',
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'File Explorer',
        highlight = 'Directory',
        text_align = 'left'
      }
    }
  }
}

map('n', ']b', ':BufferLineCycleNext<CR>', opt)
map('n', '[b', ':BufferLineCyclePrev<CR>', opt)
map('n', ']m', ':BufferLineMoveNext<CR>', opt)
map('n', '[m', ':BufferLineMovePrev<CR>', opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt) -- Close left tabs
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt) -- Close right tabs
map("n", "<leader>bo", ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", opt) -- close other tabs
map("n", "<leader>bp", ":BufferLinePickClose<CR>", opt) -- Close the selected tab
