local options = {
  panel = {
    auto_refresh = true,
    layout = {
      position = "bottom",
      ratio = 0.2,
    },
  },
  suggestion = {
    enabled = false,
    auto_trigger = true,
    keymap = {
      accept = "<leader>ca",
    },
  },
}

require("copilot").setup(options)
