local function try(f,catch_f)
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
			
			function(client,bufnr)
				local opts = {buffer=bufnr,remap = false}
				vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
				vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
				vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
				vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
				vim.keymap.set("n", "<leader>ref", function() vim.lsp.buf.references() end, opts)
				vim.keymap.set("n", "<leader>rnm", function() vim.lsp.buf.rename() end, opts)
				vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

				-- toggle highlights
				local diagnostics_active = true
				local toggleDiagnostics = function()
					diagnostics_active = not diagnostics_active
					if diagnostics_active then

						-- try to show diagnostics

						try(function()
							vim.diagnostic.show()
						end)
					else

						try(function()
							vim.diagnostic.hide()
						end)
 					end
				end

				vim.keymap.set({"n","i"},"<leader>td", toggleDiagnostics, opts)
			
				vim.diagnostic.config({
					update_in_insert = true,
				})

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
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},
}
