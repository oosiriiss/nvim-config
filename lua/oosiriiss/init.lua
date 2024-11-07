vim.g.mapleader = " "
require("oosiriiss.lazy")
require("oosiriiss.remap")

vim.cmd("set relativenumber")
vim.cmd("set number")
vim.cmd("set shiftwidth=3")


--//vim.lsp.set_log_level("DEBUG")
--//vim.notify(vim.lsp.get_log_path())
--//vim.lsp.log.set_format_func(vim.inspect)
--//
--//
--//vim.api.nvim_create_autocmd("FileType", {
--//	pattern = "kotlin",
--//	callback = function()
--//		local client = vim.lsp.start_client {
--//			name = "kotlin-ls",
--//			cmd = { "gradle", "run", "-q", "--console=plain", "--project-dir", "/home/oosiriiss/personal/kotlin-ls"
--//			}
--//		}
--//		if not client then
--//			vim.notify "Couldn't intialize client"
--//			return
--//		end
--//		vim.notify "Opened Kotlin file"
--//		vim.lsp.buf_attach_client(0, client)
--//	end
--//})
