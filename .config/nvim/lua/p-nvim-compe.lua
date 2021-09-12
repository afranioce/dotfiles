local fn = vim.fn
local o = vim.o
local cmd = vim.cmd
local nvim_replace_termcodes = vim.api.nvim_replace_termcodes
local map = vim.api.nvim_set_keymap
local mapOpts = { expr = true }

o.completeopt = 'menuone,noselect'

-- Compe setup
require'compe'.setup {
  documentation = true;

  source = {
    path = true,
    nvim_lsp = true,
    luasnip = true,
    buffer = true,
    spell = true,
    calc = false,
    nvim_lua = false,
    vsnip = false,
    ultisnips = false,
    vim_dadbod_completion = true
  };
}

local t = function(str)
  return nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = fn.col('.') - 1
    if col == 0 or fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
local luasnip = require 'luasnip'

_G.tab_complete = function()
  if fn.pumvisible() == 1 then
    return t '<C-n>'
  elseif luasnip.expand_or_jumpable() then
    return t '<Plug>luasnip-expand-or-jump'
  elseif check_back_space() then
    return t '<Tab>'
  else
    return fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if fn.pumvisible() == 1 then
    return t '<C-p>'
  elseif luasnip.jumpable(-1) then
    return t '<Plug>luasnip-jump-prev'
  else
    return t '<S-Tab>'
  end
end

require'luasnip/loaders/from_vscode'.load()

-- Map tab to the above tab complete functions
map('i', '<Tab>', 'v:lua.tab_complete()', mapOpts)
map('s', '<Tab>', 'v:lua.tab_complete()', mapOpts)
map('i', '<S-Tab>', 'v:lua.s_tab_complete()', mapOpts)
map('s', '<S-Tab>', 'v:lua.s_tab_complete()', mapOpts)

-- Map compe confirm and complete functions
map('i', '<cr>', 'compe#confirm("<cr>")', mapOpts)
map('i', '<c-space>', 'compe#complete()', mapOpts)

cmd [[highlight link CompeDocumentation NormalFloat]]
