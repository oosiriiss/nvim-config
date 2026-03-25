local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
	{
		spec = {
			import = "oosiriiss.plugins"
		},
		rocks = {
			enabled = false
		},
		performance = { -- treesitter complaints about not being in runtimepath
			rtp = {
				paths = {
					vim.fs.normalize(vim.fn.stdpath("data") .. "/site"),
				},
			}
		}

	}
)
