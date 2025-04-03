-- remember compile-mode.lua
return {
  "https://github.com/skywind3000/asyncrun.vim",
  enabled = true,
  lazy = false,
-- AsyncRun
  keys = {
    { '<leader>N', 
      function ()
        local user_input = vim.fn.input("Enter Command: ")
        vim.cmd('AsyncRun ' .. user_input)
      end,
      mode = { 'n' }, desc = " Async Run Command/Compile" },
  }
}
