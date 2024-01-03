-- [[ Tokyonight ]]
--
local tokyonight = {
  'folke/tokyonight.nvim',
  lazy = false,
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

-- [[ solarized-osaka ]]
--
local solarized_osaka = {
  'craftzdog/solarized-osaka.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'solarized-osaka'
    require('solarized-osaka').setup {}
  end,
}

-- [[ catppuccin ]]
--
local catppuccin = {
  'catppuccin/nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
      -- latte, frappe, macchiato, mocha
      flavour = 'mocha',
    }
    vim.cmd.colorscheme 'catppuccin'
  end,
}

return catppuccin
