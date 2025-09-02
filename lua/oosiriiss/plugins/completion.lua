return {
	'saghen/blink.cmp',
	dependencies = { 'rafamadriz/friendly-snippets' },
	version = '1.*',
	opts = {
		keymap = { preset = 'default' },
		appearance = { nerd_font_variant = 'mono' },
		signature = { enabled = true },
		completion = {
			documentation = {
				auto_show = true,
			        auto_show_delay_ms = 0,
				window = { border = "rounded", }
			},
			ghost_text = { enabled = true },
			menu = {
				border = "rounded",
				draw = {
					padding = { 1, 1 },
					columns = {
						{ "kind_icon" },
						{ "label",    "label_description", gap = 1 },
						{ "kind", }
					},
				},
			},
		},
		sources = { default = { 'lsp', 'path', 'snippets', 'buffer' }, },
		fuzzy = { implementation = "rust" },
	},
	opts_extend = { "sources.default" }
}
