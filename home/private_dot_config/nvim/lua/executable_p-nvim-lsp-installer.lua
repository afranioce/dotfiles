local cmd = vim.api.nvim_command
local lsp = vim.lsp

local lsp_installer = require('nvim-lsp-installer')

local server_opts = {
  eslintls = function()
    return {
      settings = {
        format = {
          enable = true,
        },
      }
    }
  end,
}

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
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
--"        hi LspReferenceRead cterm=bold ctermbg=237 guibg=#504945
--"        hi LspReferenceText cterm=bold ctermbg=238 guibg=#504945
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
end


-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches

local setup = function(opts)
  local capabilities = lsp.protocol.make_client_capabilities(lsp.protocol.make_client_capabilities())
  capabilities.textDocument.completion.completionItem.snippetSupport = true

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

lsp_installer.on_server_ready(function(server)
  local server_options = server_opts[server.name] and server_opts[server.name]() or {}

  server:setup(setup(server_options))
end)
