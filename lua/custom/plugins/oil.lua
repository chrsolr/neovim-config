return {
  'stevearc/oil.nvim',
  opts = {
    keymaps = {
      ['<ESC>'] = 'actions.close',
      ['<C-c>'] = 'actions.close',
    },
  },
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
