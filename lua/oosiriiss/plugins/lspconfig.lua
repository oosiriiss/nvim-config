return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig =
			 require("lspconfig")
		-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('UserLspConfig', {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
				vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts)
				vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)
				vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
				vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
				vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
				vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
				vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
				vim.keymap.set("n", "<leader>wss", function() vim.lsp.buf.workspace_symbol() end, opts)
				-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
				-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
				-- vim.keymap.set('n', '<space>wl', function()
				--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				-- end, opts)
				vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
				vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
				vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<leader>ref", function() vim.lsp.buf.references() end, opts)
				vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
				vim.keymap.set({ "i", "n" }, "<A-l>", function() vim.lsp.buf.format() end, opts)
			end,
		})
	    
	       -- lsps are configured in completion
	       
--			local capabilities = require('cmp_nvim_lsp').default_capabilities()
--
--			local lspconfig = require('lspconfig')
--			lspconfig.pyright.setup {
--				capabilities = capabilities
--			}
--			lspconfig.rust_analyzer.setup {
--				capabilities = capabilities
--			}
--
--			lspconfig.lua_ls.setup {
--				capabilities = capabilities
--			}

		-- Remaps
	end
}
