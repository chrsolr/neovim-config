return {
  'CopilotC-Nvim/CopilotChat.nvim',
  enabled = true,
  build = 'make tiktoken',
  lazy = false,
  dependencies = {
    { 'zbirenbaum/copilot.lua' },
    { 'nvim-lua/plenary.nvim', branch = 'main' },
  },
  opts = {
    model = 'claude-3.5-sonnet',
  },
}
