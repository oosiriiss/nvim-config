local function try(f, catch_f)
	local status, exception = pcall(f)
	if not status then
		if catch_f then
			catch_f(exception)
		end
	end
end

return
{
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		name = "lsp-zero",
		config = function()
			local lsp = require("lsp-zero")

			lsp.on_attach(

				function(client, bufnr)
					local opts = { buffer = bufnr, remap = false }
					-- got o definiton remap

					vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
					vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
					vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)

					vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
					vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
					vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)

					vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
					vim.keymap.set("n", "<leader>ref", function() vim.lsp.buf.references() end, opts)
					vim.keymap.set("n", "<leader>rnm", function() vim.lsp.buf.rename() end, opts)
					vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

					vim.keymap.set({ "i", "n" }, "<A-l>", function() vim.lsp.buf.format() end, opts)

					-- toggle highlights
					local diagnostics_active = true
					local toggleDiagnostics = function()
						diagnostics_active = not diagnostics_active
						if diagnostics_active then
							-- try to show diagnostic

							vim.diagnostic.config({ update_in_insert = true })
							try(function()
								vim.diagnostic.show()
							end)
						else
							vim.diagnostic.config({ update_in_insert = false })
							try(function()
								vim.diagnostic.hide()
							end)
						end
					end

					vim.keymap.set({ "n", "i" }, "<F1>", toggleDiagnostics, opts)
				end)


			require("mason").setup({})
			lsp.extend_lspconfig();
			require("mason-lspconfig").setup({
				handlers = {
					lsp.default_setup,
				}
			})
		end
	},
	{ 'neovim/nvim-lspconfig' },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'L3MON4D3/LuaSnip' },
	{ 'hrsh7th/cmp-buffer' },
	{
		'hrsh7th/nvim-cmp',

		config = function()
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" }
				})
			})
		end
	},
	--{ 'hrsh7th/cmp-path'}
}
