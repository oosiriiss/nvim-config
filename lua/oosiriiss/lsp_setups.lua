function setup_all() 

local capabilities = require('cmp_nvim_lsp').default_capabilities()
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

lspconfig.rust_analyzer.setup {}
lspconfig.lua_ls.setup {}
-- Formatting options specified in .clang-format in repo root
-- copy it in desired projects
lspconfig.clangd.setup {}
lspconfig.bashls.setup {}
lspconfig.cmake.setup {}
lspconfig.glslls.setup {}
lspconfig.gopls.setup {}

capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.html.setup {capabilities = capabilities,}
lspconfig.cssls.setup {capabilities = capabilities,}
lspconfig.glslls.setup {}
lspconfig.sqls.setup {}
lspconfig.hls.setup {}

--
-- On arch linux the executable had to be manually added to path
-- package was qt6-declarative
-- It was in /usr/lib/qt6/bin
lspconfig.qmlls.setup {filetypes = { "qml" } }

lspconfig.zls.setup {}
lspconfig.prolog_ls.setup{}

end

return { 
   setup=function() setup_all() end 
}
