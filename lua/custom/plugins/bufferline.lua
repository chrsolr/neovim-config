return {
  'akinsho/bufferline.nvim',
  enabled = true,
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup {
      options = {
        numbers = 'none',
      },
    }
  end,
}
