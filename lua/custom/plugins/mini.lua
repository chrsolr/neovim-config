return {
  -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  enabled = true,
  config = function()
    require('mini.surround').setup {}
    require('mini.statusline').setup {}

    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
