-- [[ Tokyonight ]]
--
return {
	'folke/tokyonight.nvim',
	priority = 1000,
	config = function()
		require('tokyonight').setup {
			-- [[ Option ]]
			-- [[ Light: `storm`, `moon` ]]
			-- [[ Dark: `night`, `day` ]]
			style = 'night',
			transparent = false,
		}
		vim.cmd.colorscheme 'tokyonight'
	end,
}
