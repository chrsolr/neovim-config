return {
	-- Highlight, edit, and navigate code
	'nvim-treesitter/nvim-treesitter',
	dependencies = {
		'nvim-treesitter/nvim-treesitter-textobjects',
	},
	build = ':TSUpdate',
	config = function()
		-- [[ Configuration ]]
		--
		require('nvim-treesitter.configs').setup {
			ensure_installed = {
				'html',
				'lua',
				'tsx',
				'typescript',
				'vimdoc',
				'vim',
				'c_sharp'
			},

			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },

			incremental_selection = {
				init_selection = '<c-space>',
				node_incremental = '<c-space>',
				node_decremental = '<M-space>',
				scope_incremental = '<c-s>',
			},

			textobject = {
				select = {
					enable = true,
					lookahead = true
				}
			},

			move = {
				enable = true,
				set_jump = true
			},

			swap = {
				enable = true,
			}
		}
	end
}
