return {
  "zbirenbaum/copilot.lua",
  enabled = true,
  event = "InsertEnter",
  cmd = "Copilot",
  config = function()
    require("configs.copilot")
  end,
}
