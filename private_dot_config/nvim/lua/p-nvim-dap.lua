local projContDir = os.getenv('HOME') .. '/Projects/Contribs/';
local map = vim.api.nvim_set_keymap
local sign_define = vim.fn.sign_define
local opts = {noremap = true, silent = true}

local dap = require'dap'


---- Keymap based on Vistual Studio https://docs.microsoft.com/en-us/visualstudio/ide/default-keyboard-shortcuts-in-visual-studio?view=vs-2019
map('n', '<F5>', '<cmd>lua require"dap".continue()<cr>', opts)
map('n', '<S-F5>', '<cmd>lua require"dap".stop()<cr>', opts)
map('n', '<C-S-F5>', '<cmd>lua require"dap".disconnect({ restart = true })<cr>', opts) -- Restart
map('n', '<F9>', '<cmd>lua require"dap".toggle_breakpoint()<cr>', opts)
map('n', '<F10>', '<cmd>lua require"dap".step_over()<cr>', opts)
map('n', '<C-F10>', '<cmd>lua require"dap".run_to_cursor()<cr>', opts)
map('n', '<F11>', '<cmd>lua require"dap".step_into()<cr>', opts)
map('n', '<S-F11>', '<cmd>lua require"dap".step_out()<cr>', opts)

sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
sign_define('DapStopped', {text='⭐️', texthl='', linehl='', numhl=''})

dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { projContDir .. '/vscode-php-debug/out/phpDebug.js' }
}

-- add support to Visual Studio Code launch.json
-- require'dap.ext.vscode'.load_launchjs()

