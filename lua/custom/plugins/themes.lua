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
    vim.cmd.hi 'Comment qui=none'
  end,
}

-- [[ solarized-osaka ]]
--
local solarized_osaka = {
  'craftzdog/solarized-osaka.nvim',
  lazy = false,
  config = function()
    require('solarized-osaka').setup {
      -- style = 'day',
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
    -- vim.cmd [[colorscheme solarized-osaka]]
    -- vim.cmd [[colorscheme solarized-osaka-day]]
    -- vim.cmd [[colorscheme solarized-osaka-night]]
    -- vim.cmd [[colorscheme solarized-osaka-storm]]
    vim.cmd [[colorscheme solarized-osaka-moon]]
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
      -- flavour = 'latte',
      -- flavour = 'frappe',
      -- flavour = 'macchiato',
      flavour = 'mocha',
    }
    vim.cmd.colorscheme 'catppuccin'
    vim.cmd.hi 'Comment gui=none'
  end,
}

local bluloco = {
  'uloco/bluloco.nvim',
  lazy = false,
  priority = 1000,
  dependencies = { 'rktjmp/lush.nvim' },
  config = function()
    require('bluloco').setup {}
    vim.cmd.colorscheme 'bluloco'
  end,
}

local rose_pine = {
  'rose-pine/neovim',
  name = 'rose-pine',
  lazy = false,
  priority = 1000,
  config = function()
    require('rose-pine').setup {
      -- variant = "auto", -- auto, main, moon, or dawn
      -- dark_variant = "main", -- main, moon, or dawn
      variant = 'main',
    }

    vim.cmd 'colorscheme rose-pine'
    -- vim.cmd("colorscheme rose-pine-main")
    -- vim.cmd("colorscheme rose-pine-moon")
    -- vim.cmd("colorscheme rose-pine-dawn")
  end,
}

local serika_dark = {
  'chrsolr/serika-dark.nvim',
  -- dir = '~/dev/serika',
  lazy = false,
  config = function()
    vim.cmd 'colorscheme serika'
  end,
}

return serika_dark -- rose_pine
