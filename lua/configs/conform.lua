local options = {
  notify_on_error = true,

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },

  formatters_by_ft = {
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescriptreact = { "prettierd" },
    lua = { "stylua" },
    -- html = { "prettierd" },
    -- css = { "prettierd" },
    toml = { "taplo" },
    cs = { "csharpier" },
    sql = { "sql_formatter" },
  },

  formatters = {
    sql_formatter = {
      command = "sql_formatter",
      stdin = true,
      args = {
        "-c",
        '{ "expressionWidth": 81, "tabWidth": 2, "keywordCase": "upper", "language": "postgresql" }',
      },
    },
  },
}

return options
