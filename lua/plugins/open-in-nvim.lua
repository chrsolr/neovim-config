return {
  'chrsolr/open-in.nvim',
  -- dir = '~/dev/open-in.nvim',
  lazy = false,
  enabled = true,
  config = function()
    require('open-in').setup()
  end,
}
