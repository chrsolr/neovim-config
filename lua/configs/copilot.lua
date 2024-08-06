local options = {
  panel = {
    auto_refresh = true,
    layout = {
      position = "bottom",
      ratio = 0.2,
    },
  },
  suggestion = {
    auto_trigger = true,
    keymap = {
      accept = "<C-a>",
    },
  },
}

require("copilot").setup(options)
