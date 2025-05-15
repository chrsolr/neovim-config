local options = {
  notify_on_error = true,

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },

  formatters_by_ft = {
    javascript = { "prettier", "prettierd", stop_after_first = true },
    typescript = { "prettier", "prettierd", stop_after_first = true },
    javascriptreact = { "prettier", "prettierd", stop_after_first = true },
    typescriptreact = { "prettier", "prettierd", stop_after_first = true },
    json = { "prettier", "prettierd", stop_after_first = true },
    html = { "prettier", "prettierd", stop_after_first = true },
    yaml = { "prettier", "prettierd", stop_after_first = true },
    css = { "prettierd", "prettierd", stop_after_first = true },
    lua = { "stylua" },
    toml = { "taplo" },
    -- cs = { "csharpier" },
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
