return {
  "williamboman/mason-lspconfig.nvim",
  enabled = true,
  event = "VeryLazy",
  cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
  dependencies = { "nvim-lspconfig" },
  config = function()
    require("configs.mason-lspconfig")
  end,
}
