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
  config = function()
    require('solarized-osaka').setup {
      style = 'day',
      on_highlights = function(hl, c)
        hl.TelescopeNormal = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopeBorder = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopePromptNormal = {
          bg = c.bg_dark,
        }
        hl.TelescopePromptBorder = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopePromptTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopePreviewTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopeResultsTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
      end,
    }
    vim.cmd [[colorscheme solarized-osaka]]
    -- vim.cmd [[colorscheme solarized-osaka-day]]
    -- vim.cmd [[colorscheme solarized-osaka-night]]
    -- vim.cmd [[colorscheme solarized-osaka-storm]]
    -- vim.cmd [[colorscheme solarized-osaka-moon]]
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

return solarized_osaka
