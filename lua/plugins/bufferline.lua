return {
  'akinsho/bufferline.nvim',
  enabled = true,
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {
    options = {
      numbers = 'none',
      show_tab_indicators = true,
      offsets = {
        {
          filetype = 'NvimTree',
          text = '',
          highlight = 'Directory',
          separator = true, -- use a "true" to enable the default, or set your own character
        },
        {
          filetype = 'neo-tree',
          text = 'Neo-tree',
          highlight = 'Directory',
          text_align = 'left',
        },
      },
    },
  },
}
