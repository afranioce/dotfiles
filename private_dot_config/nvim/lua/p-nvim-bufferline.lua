local o = vim.o
local map = vim.api.nvim_set_keymap

o.termguicolors = true -- Enable colors properly

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

map('n', ']b', ':BufferLineCycleNext<CR>', {})
map('n', '[b', ':BufferLineCyclePrev<CR>', {})
map('n', ']m', ':BufferLineMoveNext<CR>', {})
map('n', '[m', ':BufferLineMovePrev<CR>', {})
