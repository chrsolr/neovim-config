return {
  'CopilotC-Nvim/CopilotChat.nvim',
  enabled = false,
  branch = 'canary',
  lazy = false,
  dependencies = {
    { 'zbirenbaum/copilot.lua' },
    { 'nvim-lua/plenary.nvim' },
  },
  opts = {
    debug = true,
  },
}
