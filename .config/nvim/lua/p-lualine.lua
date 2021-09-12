
require('lualine').setup {
  options = {
    theme = 'dracula'
  },
  sections = {
    lualine_b = {
      'branch',
      'diff',
    },
    lualine_c = {
      {
        "diagnostics",
        sources = {"nvim_lsp"},
        symbols = {error = ' ', warn = ' ', info = ' '},
      },
      {
        "filename",
        file_status = true, -- displays file status (readonly status, modified status)
        path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
      }
    },
    lualine_x = {"filetype", 'lsp_progress'},
  },
  extensions = { 'nvim-tree', 'quickfix' },
}

