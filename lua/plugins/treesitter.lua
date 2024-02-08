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
			ensure_installed = { "c", "lua", "vim", "vimdoc", "query","rust","cpp","kotlin","javascript","typescript","rust","cpp","html", },

			auto_install = true,

			auto_install = true,

			highlight = {

				enable = true,

				additional_vim_regex_highlighting = false,
			}
		}
		)
	end

}
