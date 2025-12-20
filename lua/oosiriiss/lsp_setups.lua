function setup_all()
	local capabilities = require("blink.cmp").get_lsp_capabilities()
	local lspconfig = require('lspconfig')

	lspconfig.pyright.setup {
		capabilities = capabilities
	}

	-- formatting with black on save
	vim.api.nvim_create_autocmd(
		"BufWritePost",
		{
			pattern = "*.py",
			callback = function()
				vim.cmd("silent !black --quiet %")
			end,
		}
	)

	lspconfig.rust_analyzer.setup { capabilities = capabilities }
	lspconfig.lua_ls.setup { capabilities = capabilities }
	-- Formatting options specified in .clang-format in repo root
	-- copy it in desired projects
	lspconfig.clangd.setup {
		capabilities = capabilities,
		cmd = { "clangd", "--clang-tidy", "--enable-config" }

	}
	lspconfig.bashls.setup { capabilities = capabilities }
	lspconfig.cmake.setup { capabilities = capabilities }
	lspconfig.glslls.setup { capabilities = capabilities }
	lspconfig.gopls.setup { capabilities = capabilities }

	lspconfig.glslls.setup { capabilities = capabilities }
	lspconfig.sqls.setup { capabilities = capabilities }
	lspconfig.hls.setup { capabilities = capabilities }

	vim.lsp.enable('angularls')

	-- requires 'npm i -g vscode-langservers-extracted'
	--
	local htmlcap = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true;
	vim.lsp.config('html', {
		capabilities = htmlcap,
	})
	vim.lsp.enable('html')

	local csscap = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	-- requires 'npm i -g vscode-langservers-extracted'
	--
	vim.lsp.config('cssls', {
		capabilities = csscap,
	})
	vim.lsp.enable('cssls');

	-- requires 'npm i -g vscode-smarty-langserver-extracted'
	vim.lsp.enable('smarty_ls')

	--
	-- On arch linux the executable had to be manually added to path
	-- package was qt6-declarative
	-- It was in /usr/lib/qt6/bin
	lspconfig.qmlls.setup { filetypes = { "qml" } }

	lspconfig.zls.setup { capabilities = capabilities }
	lspconfig.prolog_ls.setup { capabilities = capabilities }

	vim.lsp.enable('csharp_ls')
end

return {
	setup = function() setup_all() end
}
