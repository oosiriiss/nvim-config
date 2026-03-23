function setup_all()
	vim.api.nvim_create_autocmd('LspAttach', {
		group = vim.api.nvim_create_augroup('UserLspConfig', {}),
		callback = function(ev)
			-- Enable completion triggered by <c-x><c-o>
			vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

			-- Buffer local mappings.
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			local opts = { buffer = ev.buf }
			vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
			vim.keymap.set('n', ']d', function() vim.lsp.diagnostic.goto_next() end, opts)
			vim.keymap.set('n', '[d', function() vim.lsp.diagnostic.goto_prev() end, opts)
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
			vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
			vim.keymap.set("n", "<leader>wss", function() vim.lsp.buf.workspace_symbol() end, opts)
			vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
			vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
			vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "<leader>ref", function() vim.lsp.buf.references() end, opts)
			vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
			vim.keymap.set({ "i", "n" }, "<A-l>", function() vim.lsp.buf.format() end, opts)
		end,
	})


	local blink_capabilities = require("blink.cmp").get_lsp_capabilities()


	local lsps = {
		{ name = "pyright" },
		{ name = "rust_analyzer" },
		{ name = "lua_ls" },
		{
			name = "clangd",
			overrides = {
				cmd = { "clangd", "--clang-tidy", "--enable-config" }
			}
		},
		{ name = "bashls" },
		{ name = "cmake" },
		{ name = "glslls" },
		{ name = "sqls" },
		{ name = "hls" },
		{ name = "html" },
		{ name = "cssls" },
		{ name = "qmlls" },
		{ name = "zls" },
		{ name = "csharp_ls" }
	};


	for _, lsp in ipairs(lsps) do
		local name = lsp["name"];
		local overrides = lsp["overrides"];

		if not overrides then
			overrides = { capabilities = blink_capabilities };
		end

		vim.lsp.config(name, overrides)
		vim.lsp.enable(name);
	end
end

return {
	setup = function() setup_all() end
}
