return {
  'aMOPel/nvim-treesitter-nim',
  build = function()
    vim.cmd"TSUpdate nim"
    vim.cmd"TSUpdate nim_format_string"
  end,
}
