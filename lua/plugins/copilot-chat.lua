return {
  'CopilotC-Nvim/CopilotChat.nvim',
  enabled = true,
  branch = 'main',
  lazy = false,
  dependencies = {
    { 'zbirenbaum/copilot.lua' },
    { 'nvim-lua/plenary.nvim' },
  },
  opts = {
    model = 'claude-3.5-sonnet',
  },
}
