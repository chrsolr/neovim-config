return {
  'zapling/mason-conform.nvim',
  enabled = true,
  event = 'VeryLazy',
  dependencies = { 'conform.nvim' },
  config = function()
    require('mason-conform').setup {
      ignore_install = {},
    }
  end,
}
