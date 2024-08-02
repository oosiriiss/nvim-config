return {

	"rose-pine/neovim",
	name = "rose-pine",
	opts = {
		variant = "main",  -- auto, main, moon, or dawn
		dark_variant = "main", -- main, moon, or dawn
		dim_inactive_windows = false,
		extend_background_behind_borders = true,

		enable = {
			terminal = true,
			legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
			migrations = true,  -- Handle deprecated options automatically
		},

		styles = {
			bold = true,
			italic = true,
			transparency = false,
		},

	},
	config = function(_, opts)
		require('rose-pine').setup(opts)

		vim.cmd('colorscheme rose-pine')
	end


}

--return {
--	"catppuccin/nvim",
--	name = "catppuccin",
--	priority = 1000,
--	config = function()
--		require("catppuccin").setup({
--			flavour = "mocha", -- latte, frappe, macchiato, mocha
--			-- flavour = "auto" -- will respect terminal's background
--			background = { -- :h background
--				light = "latte",
--				dark = "mocha",
--			},
--			transparent_background = false, -- disables setting the background color.
--			show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
--			term_colors = false,       -- sets terminal colors (e.g. `g:terminal_color_0`)
--			dim_inactive = {
--				enabled = false,        -- dims the background color of inactive window
--				shade = "dark",
--				percentage = 0.15,      -- percentage of the shade to apply to the inactive window
--			},
--			no_italic = false,         -- Force no italic
--			no_bold = false,           -- Force no bold
--			no_underline = false,      -- Force no underline
--			styles = {                 -- Handles the styles of general hi groups (see `:h highlight-args`):
--				comments = { "italic" }, -- Change the style of comments
--				conditionals = { "italic" },
--				loops = {},
--				functions = {},
--				keywords = {},
--				strings = {},
--				variables = { "bold" },
--				numbers = {},
--				booleans = {},
--				properties = {},
--				types = {},
--				operators = {},
--				-- miscs = {}, -- Uncomment to turn off hard-coded styles
--			},
--			color_overrides = {},
--			custom_highlights = {},
--			default_integrations = true,
--			integrations = {
--				cmp = true,
--				gitsigns = true,
--				nvimtree = true,
--				treesitter = true,
--				notify = false,
--				mini = {
--					enabled = true,
--					indentscope_color = "",
--				},
--				-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
--			},
--		})
--
--		-- setup must be called before loading
--		vim.cmd.colorscheme "catppuccin"
--	end
--}
