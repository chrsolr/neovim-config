return {
  enabled = false,
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  opts = {
    options = {
      icons_enabled = false,
      -- theme = 'tokyonight',
      -- theme = 'rose-pine',
      -- theme = 'catppuccin',
      -- theme = 'onedark',
      theme = 'solarized-osaka',
      component_separators = '|',
      section_separators = '',
    },
  },
}
