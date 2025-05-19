return {

	{ 'hrsh7th/cmp-nvim-lsp', name = "cmp_nvim_lsp" },
	-- nvim-cmp source for buffer words.
	{ 'hrsh7th/cmp-buffer', },
	-- nvim-cmp source for filesystem paths
	{ 'hrsh7th/cmp-path', },
	-- nvim-cmp source for vim{'s cmdline.},
	{ 'hrsh7th/cmp-cmdline' },
	{
		'L3MON4D3/LuaSnip',
		name = "luasnip",
		tag = "v2.3.0",
		run = "make install_jsregexp"
	},
	-- luasnip completion source for nvim-cmp
	{ 'saadparwaiz1/cmp_luasnip', },
	-- Set up nvim-cmp.
	{
		'hrsh7th/nvim-cmp',

		config = function()
			local cmp = require 'cmp'
			cmp.setup({
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					['<C-UP>'] = cmp.mapping.scroll_docs(-4),
					['<C-DOWN>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' }, -- For luasnip users.
				}, {
					{ name = 'buffer' },
				})
			})

			-- Set configuration for specific filetype.
			cmp.setup.filetype('gitcommit', {
				sources = cmp.config.sources({
					{ name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
				        }, {
					{ name = 'buffer' },
				})
			})

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ '/', '?' }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = 'buffer' }
				}
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = 'path' }
				}, {
					{ name = 'cmdline' }
				}),
				matching = { disallow_symbol_nonprefix_matching = false }
			})
			require("oosiriiss.lsp_setups").setup();
		end
	},
}
