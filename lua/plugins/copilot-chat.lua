return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		lazy = false,
		dependencies = {
			{ "github/copilot.vim" },
			{ "nvim-lua/plenary.nvim" },
		},
		opts = {
			debug = true, -- Enable debugging
		},
	},
}
