return {
	'nvim-telescope/telescope.nvim',
	tag = "v0.2.1",
	keys = {
		{ "<leader>pf" },
		{ "<leader>ps" },
		{ "<leader>pg" },
		{ "<leader>pb" },
	},
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install' }
	},
	config = function()
		local builtin = require('telescope.builtin')

		vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
		vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
		vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
		vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
		-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
	end
}
