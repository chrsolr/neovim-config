return {
  'akinsho/bufferline.nvim',
  enabled = true,
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup {
      options = {
        numbers = 'none',
        -- offsets = {
        --   {
        --     filetype = 'NvimTree',
        --     text = '',
        --     highlight = 'Directory',
        --     separator = false, -- use a "true" to enable the default, or set your own character
        --   },
        -- },
      },
    }
  end,
}
