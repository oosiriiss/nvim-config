-- general

-- content of run-app.bat should look somewhat like this
-- gradlew assemble && adb -e install -r app/build/outputs/apk/debug/app-debug.apk && adb -e shell am start -n com.bscode.todoapp/com.bscode.todoapp.MainActivity

vim.keymap.set("n", "<F5>",
	function()
		vim.cmd("set splitright")
		vim.cmd("vsplit")
		vim.cmd("vertical-resize 70")
		vim.cmd("terminal .\\run-app.bat")
		-- go to previous window
		vim.cmd("wincmd p")
	end
)
vim.keymap.set("n", "<F6>",
	function()
	vim.fn.system("start pwsh.exe -NoExit -Command \"emulator -avd Pixel_XL_API_33\"")
	end
)
-- vertical movement is centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- searching with centered viewport
vim.keymap.set("n", "n", "nzzzv")

vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("v", "<C-v>", "<C-v>", { noremap = false })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--vim.keymap.set("n", "<leader>wpv",
-- function()
-- vim.cmd("w")
-- vim.cmd("Ex")
-- end)
-- vim.keymap.set("n","<C-s>",vim.cmd.w)

-- telescope remaps
