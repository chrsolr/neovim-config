return {
  'akinsho/bufferline.nvim',
  enabled = true,
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup {
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
        },
      },
    }
  end,
}
