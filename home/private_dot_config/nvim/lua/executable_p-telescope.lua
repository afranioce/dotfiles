local map = vim.api.nvim_set_keymap
local cmd = vim.api.nvim_command
local opts = {noremap = true, silent = true}

require('telescope').setup {
  extensions = {
    project = {
      base_dirs = {
        {'~/Projects', max_depth = 5},
      },
    }
  }
}

-- load extensions
require'telescope'.load_extension('project')

-- telescope.lsp_workspace_symbols =  function()
--   local input = vim.fn.input('Query: ')
--   cmd('normal :esc<CR>')
--   cmd('echom "' .. input .. '"')
--   if not input or #input == 0 then return end
--   require('telescope.builtin').lsp_workspace_symbols{
--       query = input
--   }
-- end

map('n', '<C-p>', "<cmd>lua require('telescope').extensions.project.project{}<cr>", opts)
map('n', '<leader>e', "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", opts)
map('n', '<leader>w', "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>", opts)
map('n', '<leader><leader>', "<cmd>lua require('telescope.builtin').keymaps()<cr>", opts)
map('n', '<Leader>gt', "<cmd>lua require('telescope.builtin').git_status()<cr>", opts)
map('n', '<Leader>cm', "<cmd>lua require('telescope.builtin').git_commits()<cr>", opts)
map('n', '<Leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
map('n', '<Leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
map('n', '<Leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
map('n', '<Leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
map('n', '<Leader>fo', "<cmd>lua require('telescope.builtin').oldfiles()<cr>", opts)
map('n', 'gr', "<cmd>lua require('telescope.builtin').lsp_references()<cr>", opts)
-- map("n", "gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", opts)
-- map("n", "gi", "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", opts)
