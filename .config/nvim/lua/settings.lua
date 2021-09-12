--
-- General Settings
-- :h defaults
--
local o = vim.o -- Global Options
local fn = vim.fn
local g = vim.g
local v = vim.v
local lsp = vim.lsp
local cmd = vim.cmd
local nvim_cmd = vim.api.nvim_command
local wo = vim.wo -- Window Options
local bo = vim.bo -- Buffer Options

-- Theme
cmd [[colorscheme dracula]]

g.mapleader = ','

-- o.foldtext = [[v:lua.string.format("  %s: %d lines", v:lua.vim.fn.getline(v:lua.vim.v.foldstart), v:lua.vim.v.foldend - v:lua.vim.v.foldstart + 1)]]
-- Folding settings
o.foldmethod = 'indent' -- fold based on indent
o.foldnestmax = 10 -- deepest fold is 10 levels
o.foldlevel = 1 -- this is just what i use
-- o.fillchars = '{ eob = "-", fold = " " }'

-- Keep all folds open when a file is opened
cmd [[
augroup OpenAllFoldsOnFileOpen
  autocmd!
  autocmd BufRead * setlocal nofoldenable
augroup END
]]

-- Softtabs
o.tabstop = 2
o.shiftwidth = 2
o.shiftround = true
o.expandtab = true -- Converts tabs into spaces

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

nvim_cmd [[command! Term :bot sp | term]] -- terminal split, at the bottom of the screen
nvim_cmd [[command! Te :Term]] -- Term short key
nvim_cmd [[autocmd TermOpen term://* startinsert]] -- automatically start insert mode when I open new terminal
