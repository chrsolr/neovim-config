return {
  "CopilotC-Nvim/CopilotChat.nvim",
  enabled = true,
  build = "make tiktoken",
  lazy = false,
  dependencies = {
    { "zbirenbaum/copilot.lua" },
    { "nvim-lua/plenary.nvim", branch = "master" },
  },
  opts = {
    model = "gpt-4.1",
    auto_insert_mode = true,
  },
}
