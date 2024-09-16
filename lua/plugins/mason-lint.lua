return {
  'rshkarin/mason-nvim-lint',
  enabled = true,
  event = 'VeryLazy',
  dependencies = { 'nvim-lint' },
  config = function()
    require 'configs.mason-lint'
  end,
}
