local options = {
  panel = {
    auto_refresh = true,
    layout = {
      position = 'bottom',
      ratio = 0.2,
    },
  },
  suggestion = {
    auto_trigger = true,
    keymap = {
      accept = '<C-a>',
    },
  },
}

return {

  'zbirenbaum/copilot.lua',
  enabled = true,
  event = 'InsertEnter',
  cmd = 'Copilot',
  config = function()
    require('copilot').setup(options)
  end,
}
