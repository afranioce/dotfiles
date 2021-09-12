local map = vim.api.nvim_set_keymap

map('n', '<C-g>', ':lua require"neogit".open({ kind = "split" })<CR>', {})

require'neogit'.setup {
  integrations = {
    diffview = true,
  }
}
