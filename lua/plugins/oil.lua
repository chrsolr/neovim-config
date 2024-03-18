return {
	"stevearc/oil.nvim",
	event = "VeryLazy",
	opts = {
		keymaps = {
			["<ESC>"] = "actions.close",
			["<C-c>"] = "actions.close",
		},
	},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
