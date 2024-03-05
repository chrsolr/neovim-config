return {
  'Exafunction/codeium.vim',
  config = function()
    vim.api.nvim_call_function('codeium#GetStatusString', {})
  end,
}
