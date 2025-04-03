return {
  "folke/which-key.nvim",
  lazy = false,
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 200
  end,
  opts = {}
}
