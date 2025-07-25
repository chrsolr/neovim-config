return {
  "supermaven-inc/supermaven-nvim",
  enabled = false,
  event = "InsertEnter",
  config = function()
    require("configs.supermaven")
  end,
}
