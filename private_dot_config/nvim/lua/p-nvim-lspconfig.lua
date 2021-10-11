local cmd = vim.api.nvim_command
local bo = vim.bo -- Buffer Options
local lsp = vim.lsp
local fn = vim.fn
local protocol = require('vim.lsp.protocol')
local nvim_lsp = require('lspconfig')

--Enable completion triggered by <c-x><c-o>
bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

-- lsp.set_log_level("debug")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  require 'lsp_signature'.on_attach()

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
--  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Document highlight
  if client.resolved_capabilities.document_highlight then
    cmd [[autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]]
    cmd [[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]]
    cmd [[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]]

--    vim.api.nvim_exec(
--      [[
--"        hi LspReferenceRead cterm=bold ctermbg=239 guibg=#504945
--"        hi LspReferenceText cterm=bold ctermbg=239 guibg=#504945
--"        hi LspReferenceWrite cterm=bold ctermbg=243 guibg=#7c6f64
--        augroup lsp_document_highlight
--          autocmd! * <buffer>
--          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
--          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--        augroup END
--      ]],
--      false
--    )
  end

  -- Format on save
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end

  if client.resolved_capabilities.code_lens then
    buf_set_keymap("n", "<Leader>l", "<cmd>lua vim.lsp.codelens.run()<CR>", opts)

    vim.cmd [[
    augroup lsp_codelens
      autocmd! * <buffer>
      autocmd BufEnter,CursorHold,InsertLeave <buffer> lua vim.lsp.codelens.refresh()
    augroup END
    ]]
  end

--  if client.server_capabilities.colorProvider then
--    require"lsp-documentcolors".buf_attach(bufnr, { single_column = true })
--  end
end

local capabilities = lsp.protocol.make_client_capabilities(lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches

local setup = function(opts)
  local default = {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      -- Performance
      debounce_text_changes = 150,
    }
  }

  for k, v in pairs(opts) do default[k] = v end

  return default
end

local servers = {
  tsserver = {},
  phpactor = {},
  omnisharp = {
    cmd = {
      os.getenv('HOME') .. '/.local/omnisharp/run',
      '--languageserver',
      '--hostPID',
      tostring(fn.getpid())
    },
  },
  diagnosticls = {
    filetypes = {
      'php',
      'javascript',
      'typescript'
    },
    init_options = {
      filetypes = {
        javascript = {'eslint'},
        typescript = {'eslint', 'tslint'},
        php = {'phpcs', 'phpstan'},
      },
      linters = {
        phpcs = require'linters.phpcs',
        phpstan = require'linters.phpstan',
        eslint = require'linters.eslint',
        tslint = require'linters.tslint',
      },
      formatFiletypes = {
        php = {'phpcsfixer'},
        javascript = {'eslint_fmt'},
        typescript = {'eslint_fmt'},
      },
      formatters = {
        eslint_fmt = require'formatters.eslint',
        phpcsfixer = require'formatters.php-cs-fixer',
      },
    },
  },
}

for lsp, config in pairs(servers) do
  nvim_lsp[lsp].setup(setup(config))
end

local lspSymbol = function(name, icon)
  vim.fn.sign_define("LspDiagnosticsSign" .. name, {text = icon, numhl = "LspDiagnosticsDefaul" .. name})
end

lspSymbol("Error", "")
lspSymbol("Warning", "")
lspSymbol("Information", "")
lspSymbol("Hint", "")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = {
      prefix = "",
      spacing = 0
    },
    signs = true,
    underline = true,
    -- set this to true if you want diagnostics to show in insert mode
    update_in_insert = false
  }
)
