return {
  'nvim-focus/focus.nvim',
  lazy = false,
  opts = {
    enable = true,            -- Enable module
    commands = true,          -- Create Focus commands
    autoresize = {
      enable = true,          -- Enable or disable auto-resizing of splits
      width = 0,              -- Force width for the focused window
      height = 0,             -- Force height for the focused window
      minwidth = 0,           -- Force minimum width for the unfocused window
      minheight = 0,          -- Force minimum height for the unfocused window
      height_quickfix = 10,
    },
    split = {
      bufnew = false,   -- Create blank buffer for new split windows
      tmux = false,     -- Create tmux splits instead of neovim splits
    },
  }
}
