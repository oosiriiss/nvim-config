-- leader is set in lazy.lua
-- vim.g.mapleader = " "

-- general

-- vertical movement is centered
vim.keymap.set("n","<C-d>","<C-d>zz")
vim.keymap.set("n","<C-u>","<C-u>zz")

-- searching with centered viewport
vim.keymmap.set("n","nzzzv")
vim.keymmap.set("n","Nzzzv")

vim.keymap.set("v","<C-v>","<C-v>",{noremap = false})
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--vim.keymap.set("n", "<leader>wpv",
-- function()
-- vim.cmd("w")
-- vim.cmd("Ex")
-- end)
-- vim.keymap.set("n","<C-s>",vim.cmd.w)

-- telescope remaps 





