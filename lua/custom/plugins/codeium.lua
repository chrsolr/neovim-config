return {
  'Exafunction/codeium.vim',
  enabled = false,
  config = function()
    vim.api.nvim_call_function('codeium#GetStatusString', {})
  end,
}
