return {
	"nvim-telescope/telescope-file-browser.nvim",
	name = "telescope-file-browser",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("telescope").setup({
			extensions = {

				file_browser = {
					hijack_netrw = true,
					mappings = {
						["i"] ={
							-- custom insert mappings
						}
					},
					["n"] ={
						-- custom normal mappings
					},
					no_ignore = true,
					depth = 1,
				},
			},

		})

		require("telescope").load_extension("file_browser")
		vim.keymap.set("n", "<leader>fb",
		":Telescope file_browser path=%:p:h select_buffer=true<CR>",
		{noremap = true})
	end,
}









