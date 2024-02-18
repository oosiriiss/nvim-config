return {
	'nvim-treesitter/nvim-treesitter',
	name = "treesitter",
	build = ":TSUpdate",

	init = function(plugin)
		require("lazy.core.loader").add_to_rtp(plugin)
		require("nvim-treesitter.query_predicates")
	end,
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust" },


			auto_install = true,

			highlight = {

				enable = true,

				additional_vim_regex_highlighting = false,
			}
		}
		)
	end

}
