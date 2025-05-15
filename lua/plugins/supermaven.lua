return {
  "supermaven-inc/supermaven-nvim",
  enabled = true,
  event = "InsertEnter",
  config = function()
    require("configs.supermaven")
  end,
}
