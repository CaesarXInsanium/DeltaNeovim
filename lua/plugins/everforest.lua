return {
  "neanias/everforest-nvim",
  version = false,
  lazy = false,
  config = function()
    require("everforest").setup({
      background = "hard",
      dim_inactive_windows = true,
      italics = true,
    })
  end,
}
