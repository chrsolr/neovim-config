return {
  "zapling/mason-conform.nvim",
  enabled = true,
  event = "VeryLazy",
  dependencies = { "conform.nvim" },
  config = function()
    require("configs.mason-conform")
  end,
}
