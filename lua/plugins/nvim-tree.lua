return {
	"nvim-tree/nvim-tree.lua",

	config = function ()

		local nvim_tree = require("nvim-tree")
		local nvim_tree_api = require("nvim-tree.api")
			nvim_tree.setup({
			disable_netrw = true,
			hijack_netrw = true,
		})
	


		vim.keymap.set("n","<C-[>",nvim_tree_api.tree.change_root_to_parent)
		vim.keymap.set("n","<leader>nt",":NvimTreeToggle<CR>")
		vim.keymap.set("n","<leader>pv",":NvimTreeToggle<CR>:NvimTreeFindFile<CR>:q<CR>")
	end
}
