return {
	'saghen/blink.cmp',
	dependencies = { 'rafamadriz/friendly-snippets' },
	version = '1.*',
	opts = {
		keymap = { preset = 'default' },
		appearance = { nerd_font_variant = 'mono' },
		signature = { enabled = true },
		completion = {
			documentation = { auto_show = true },
			ghost_text = { enabled = true },
			menu = {
				draw = {
					columns = {
						{ "kind_icon", "kind", },
						{ "label",     "label_description", gap = 1 },
					},
				},
			},
		},
		sources = { default = { 'lsp', 'path', 'snippets', 'buffer' }, },
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" }
}
