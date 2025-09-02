vim.g.mapleader = " "
require("oosiriiss.lazy")
require("oosiriiss.remap")
require("oosiriiss.lsp_setups").setup()
require("oosiriiss.colorscheme").setup()

vim.cmd("set relativenumber")
vim.cmd("set number")
vim.cmd("set shiftwidth=3")
