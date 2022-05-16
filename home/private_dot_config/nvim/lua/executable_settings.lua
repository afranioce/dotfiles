--
-- General Settings
-- :h defaults
--
local o = vim.opt -- Global Options
local wo = vim.wo -- Window Options
local bo = vim.bo -- Buffer Options
local fn = vim.fn
local g = vim.g
local v = vim.v
local lsp = vim.lsp
local cmd = vim.cmd
local nvim_cmd = vim.api.nvim_command

g.mapleader = ','

-- o.foldtext = [[v:lua.string.format("  %s: %d lines", v:lua.vim.fn.getline(v:lua.vim.v.foldstart), v:lua.vim.v.foldend - v:lua.vim.v.foldstart + 1)]]
-- Folding settings
o.foldmethod = 'indent' -- fold based on indent
o.foldnestmax = 10 -- deepest fold is 10 levels
o.foldlevel = 1 -- this is just what i use
-- o.fillchars = {
--   eob = '-',
--   fold = ' ',
--   stl = '-', -- fill active window's statusline with -
--   stlnc = '_', -- also fill inactive windows
--   vert = '|' -- add a bar for vertical splits
-- }

-- Keep all folds open when a file is opened
cmd [[
augroup OpenAllFoldsOnFileOpen
  autocmd!
  autocmd BufRead * setlocal nofoldenable
augroup END
]]

-- Softtabs
o.softtabstop = -1 -- length to use when editing text (eg. TAB and BS keys) (0 for ‘tabstop’, -1 for ‘shiftwidth’)
o.tabstop = 2 -- Length of an actual \t character
o.shiftwidth = 0 -- length to use when shifting text (eg. <<, >> and == commands)
o.shiftround = true -- round indentation to multiples of 'shiftwidth' when shifting text (so that it behaves like Ctrl-D / Ctrl-T)
o.expandtab = true -- Converts tabs into spaces
o.autoindent = true -- Reproduce the indentation of the previous line
o.smartindent = true -- try to be smart (increase the indenting level after '{', decrease it after '}', and so on)

cmd [[filetype plugin indent on]]

o.hidden = true -- current buffer can be put into background
o.colorcolumn = '120' -- Display line at column width 120
o.number = true  -- Display signs in number column
-- o.cursorline = true -- Highlight the line under the cursor
o.mouse = 'a' -- Mouse support
o.spelllang = 'en_us' -- Spell check
o.spelloptions = 'camel'
o.clipboard = 'unnamedplus'
-- Searching
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.smartcase = true

o.guifont = 'UbuntuMono Nerd Font 11'
-- File encoding
o.encoding = 'utf-8'
o.fileencoding = 'utf-8'
o.fileencodings = 'utf-8'

-- cmd [[hi vertsplit guifg=fg guibg=bg]]
nvim_cmd [[command! Term :bot sp | term]] -- terminal split, at the bottom of the screen
nvim_cmd [[command! Te :Term]] -- Term short key
nvim_cmd [[autocmd TermOpen term://* startinsert]] -- automatically start insert mode when I open new terminal
nvim_cmd [[hi Normal guibg=none ctermbg=none]]
nvim_cmd [[hi NonText guibg=none ctermbg=none]]
