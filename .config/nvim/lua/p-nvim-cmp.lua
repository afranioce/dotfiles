local lspkind = require'lspkind'
local cmp = require'cmp'

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind] .. ' ' .. vim_item.kind
      return vim_item
    end
  },
	mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
	},
	sources = {
		{ name = "buffer" },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'luasnip' },
    { name = 'vim-dadbod-completion' }
	},
})
