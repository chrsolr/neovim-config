local M = {}

M.ui = {
	theme = "tokyonight",

	statusline = {
		theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
		-- default/round/block/arrow separators work only for default statusline theme
		-- round and block will work for minimal theme only
		separator_style = "default",
		order = nil,
		modules = nil,
	},
}

return M
