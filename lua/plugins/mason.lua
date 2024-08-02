return {
  "williamboman/mason-lspconfig.nvim",
  event = "VeryLazy",
  enabled = true,
  dependencies = { "nvim-lspconfig" },
  config = function()
    require("configs.mason-lspconfig")
  end,
}
