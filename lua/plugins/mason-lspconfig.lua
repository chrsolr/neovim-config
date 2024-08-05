return {
  "williamboman/mason-lspconfig.nvim",
  enabled = true,
  event = "VeryLazy",
  dependencies = { "nvim-lspconfig" },
  config = function()
    require("configs.mason-lspconfig")
  end,
}
