-- general

-- content of run-app.bat should look somewhat like this
-- gradlew assemble && adb -e install -r app/build/outputs/apk/debug/app-debug.apk && adb -e shell am start -n com.bscode.todoapp/com.bscode.todoapp.MainActivity

-- vertical movement is centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- searching with centered viewport
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


-- copying remaps 
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])


--vim.keymap.set("n", "<leader>wpv",
-- function()
-- vim.cmd("w")
-- vim.cmd("Ex")
-- end)
-- vim.keymap.set("n","<C-s>",vim.cmd.w)

-- telescope remaps
