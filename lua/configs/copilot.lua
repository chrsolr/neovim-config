local options = {
  panel = {
    auto_refresh = true,
    layout = {
      position = 'bottom',
      ratio = 0.2,
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    keymap = {
      accept = '<leader><Tab>',
    },
  },
}

require('copilot').setup(options)
