return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {
      'williamboman/mason.nvim',
      config = true,
    },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    {
      'j-hui/fidget.nvim',
      opts = {},
    },
    'hrsh7th/cmp-nvim-lsp',
    'folke/neodev.nvim',
  },
  config = function()
    require 'configs.lspconfig'
  end,
}
