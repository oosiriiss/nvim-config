return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false, -- Lazy load not supported
	config = function()
		local ts = require("nvim-treesitter");

		local must_have_langs = {
			"c",
			"lua",
			"cpp",
			"rust"
		};
		ts.install(must_have_langs);

		local tiers = {
			stable = 1,
			unstable = 2,
			unmaintained = 3,
			unsupported = 4,
		};

		local all_available_langs = ts.get_available();
		local stable_langs = ts.get_available(tiers["stable"]);
		local unstable_langs = ts.get_available(tiers["unstable"]);
		local unmaintained_langs = ts.get_available(tiers["unmaintained"]);
		local unsupported_langs = ts.get_available(tiers["unsupported"]);
		local installed_langs = ts.get_installed();


		local get_status = function(language)
			if vim.tbl_contains(stable_langs, language) then
				return "stable";
			end
			if vim.tbl_contains(unstable_langs, language) then
				return "unstable";
			end
			if vim.tbl_contains(unmaintained_langs, language) then
				return "unmaintained";
			end
			if vim.tbl_contains(unsupported_langs, language) then
				return "unsupported";
			end
			return "unknown";
		end


		-- checks if a language parser is installed and prints appropriate msg
		local is_installed = function(language)
			if not vim.tbl_contains(installed_langs, language) then
				-- Unsupported or missing
				if not vim.tbl_contains(all_available_langs, language) then
					return false;
				end
				if vim.tbl_contains(unsupported_langs, language) then
					print("Tree sitter for language: '" .. language .. "' is not supported");
					return false;
				end
				print("Tree sitter parser for language '" ..
					language ..
					"' is not installed. Consider installing it with: ':TSInstall " ..
					language .. "' it's status is: '" .. get_status(language) .. "'");

				return false;
			end

			return true;
		end;

		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				local bufnr = vim.api.nvim_get_current_buf();
				local language = vim.treesitter.language.get_lang(vim.bo.filetype)

				if not language then
					return;
				end

				if not is_installed(language)
				then
					return;
				end

				vim.treesitter.start(bufnr, language)

				-- Configuring code folding in case I use it
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()";
				vim.wo.foldmethod = "expr";
				vim.wo.foldlevel = 69;

				-- TS Indentation - experimental
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()";
			end
		});
	end
}
