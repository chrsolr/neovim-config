return {
  'oncomouse/lushwal.nvim',
  enabled = true,
  lazy = false,
  cmd = { 'LushwalCompile' },
  dependencies = {
    { 'rktjmp/lush.nvim' },
    { 'rktjmp/shipwright.nvim' },
  },
}
