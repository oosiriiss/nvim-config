--  for later migrating this as a plugin https://www.youtube.com/watch?v=zAkneCPIvFk

local M = {}

function M.setup()
	local colors = {

		bg = "#090909",
		bgsecondary = "#242424",
		brown = "#362820",
		gray = "#686868",
		white = "#FFFFFF",
		mutedwhite = "#D2D0D0",
		cyan = "#00FBFF",
		red = "#e05868",
		mutedred = "#a05868",
		lime = "#89F336",
		darkgreen = "#5DB926",
		yellow = "#EBCF3D",
		violet = "#D14DD1",
		orange = "#db791d",
		lightorange = "#f0b77f",
		blue = "#7083d6"
	}

	local KEYWORD = { fg = colors.red }
	local CLASS = { fg = colors.yellow }
	local FUNCTION = { fg = colors.orange }
	local MACRO = { fg = colors.violet }

	local STRING = { fg = colors.darkgreen }
	local CHAR = { fg = colors.lime }
	local NUMBER = { fg = colors.blue }
	local FLOAT = { fg = colors.blue }
	local BOOL = { fg = colors.mutedred }

	local CONSTANT = { fg = colors.mutedred }
	local IDENTIFIER = { fg = colors.lightorange }
	local OPERATOR = { fg = colors.orange }

	local TYPE = { fg = colors.yellow }



	-- See link below for more highlight group
	-- https://neovim.io/doc/user/syntax.html
	local highlights_groups = {
		Normal = { fg = colors.white, bg = colors.bg },
		-- Basic syntax
		Comment = { fg = colors.gray },
		Keyword = KEYWORD,
		["@keyword"] = KEYWORD,
		Typedef = KEYWORD,

		Class = CLASS,
		["@lsp.type.class"] = CLASS,
		StorageClass = CLASS,
		Structure = CLASS,

		Macro = MACRO,
		["@lsp.type.macro"] = MACRO,
		PreCondit = MACRO,

		Function = FUNCTION,
		["@function"] = FUNCTION,
		["@lsp.type.function"] = FUNCTION,
		["@function.builtin"] = FUNCTION,

		Constant = CONSTANT,
		["@constant"] = CONSTANT,

		Identifier = IDENTIFIER,
		["@variable"] = IDENTIFIER,
		-- ??
		-- Statement = {}
		Conditional = { fg = colors.violet },

		Type = TYPE,
		["@type"] = TYPE,

		Operator = OPERATOR,

		-- Types also wtf
		Special = TYPE,

		-- Literals
		String = STRING,
		["@string"] = STRING,
		["@lsp.type.string"] = STRING,
		Character = CHAR,
		Number = NUMBER,
		["@number"] = NUMBER,
		["@lsp.type.number"] = NUMBER,
		Boolean = BOOL,
		["@boolean"] = BOOL,

		Todo = { fg = colors.cyan },
		Error = { fg = colors.lightorange, bg = colors.red },

		-- Neovim --

		-- Matching
		CurSearch = { fg = colors.bg, bg = colors.orange },
		Substitute = { fg = colors.bg, bg = colors.orange },
		Search = { fg = colors.bg, bg = colors.orange },


		-- Cursor
		Cursor = { fg = colors.bg, bg = colors.orange },
		lCursor = { fg = colors.bg, bg = colors.orange },
		CursorIM = { fg = colors.bg, bg = colors.orange },
		TermCursor = { fg = colors.bg, bg = colors.orange },

		Visual = { fg = colors.orange, bg = colors.brown },
		VisualNOS = { fg = colors.orange, bg = colors.brown },

		-- Relative lines
		LineNr = { fg = colors.orange, bg = colors.bg },
		LineNrAbove = { fg = colors.gray, bg = colors.bg },
		LineNrBelow = { fg = colors.gray, bg = colors.bg },

		-- Utility
		MatchParen = { fg = colors.cyan, bg = colors.bgsecondary },

		-- Window
		WinSeparator = { fg = colors.orange, bg = colors.bg },
		WinBar = { fg = colors.blue, bg = colors.blue },

		StatusLine = { fg = colors.bg, bg = colors.orange },
		StatusLineNC = { fg = colors.bg, bg = colors.mutedred },

		StatusLineTerm = { fg = colors.bg, bg = colors.orange },
		StatusLineTermNC = { fg = colors.bg, bg = colors.mutedred },

		TabLine = { fg = colors.blue, bg = colors.blue },

		Directory = { fg = colors.red },

		-- Blink completion menu
		BlinkCmpKindKeyword = KEYWORD,
		BlinkCmpKindClass = CLASS,
		BlinkCmpKindInterface = CLASS,
		BlinkCmpKindStruct = CLASS,
		BlinkCmpKindEnum = CLASS,
		BlinkCmpKindTypeParameter = TYPE,
		BlinkCmpKindEnumMember = { fg = colors.orange },
		BlinkCmpKindModule = { fg = colors.mutedred },
		BlinkCmpKindFunction = FUNCTION,
		BlinkCmpKindMethod = FUNCTION,
		BlinkCmpKindReference = IDENTIFIER,
		BlinkCmpKindVariable = IDENTIFIER,
		BlinkCmpKindProperty = IDENTIFIER,
		BlinkCmpKindField = IDENTIFIER,
		BlinkCmpKindOperator = OPERATOR,
		BlinkCmpKindConstant = CONSTANT,
		BlinkCmpKindText = STRING,
		BlinkCmpKindValue = NUMBER,

		BlinkCmpLabel = { fg = colors.mutedwhite },
		BlinkCmpLabelDeprecated = { fg = colors.gray },
		BlinkCmpDoc = { bg = colors.bgsecondary },
		BlinkCmpDocBorder = { fg = colors.orange, bg = colors.bgsecondary },
		BlinkCmpDocSeparator = { fg = colors.yellow, bg = colors.bgsecondary },
		BlinkCmpMenu = { bg = colors.bgsecondary },
		BlinkCmpMenuBorder = { fg = colors.orange, bg = colors.bgsecondary },
		BlinkCmpSignatureHelpBorder = { fg = colors.orange, bg = colors.bgsecondary },
		BlinkCmpSignatureHelpActiveParameter = { bg = colors.brown },
		BlinkCmpScrollBarThumb = { bg = colors.orange },
		BlinkCmpLabelDescription = { fg = colors.orange },
		BlinkCmpLabelDetail = { fg = colors.mutedred },
	};

	for group, opts in pairs(highlights_groups) do
		vim.api.nvim_set_hl(0, group, opts);
	end
end

return M
