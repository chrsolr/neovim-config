return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    linters = {
      eslint_d = {
        args = { '--no-warn-ignored', '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
      },
    },
  },
  config = function()
    require 'configs.nvim-lint'
  end,
}
