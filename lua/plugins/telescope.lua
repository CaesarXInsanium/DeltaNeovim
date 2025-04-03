return {
  'nvim-telescope/telescope.nvim',
  enabled = true,
  dependencies = {
    'nvim-telescope/telescope-ui-select.nvim'
  },
  lazy = false,
  opts = function(plugin, opts)
    return {
      extensions = {
        require("telescope.themes").get_dropdown({})
      }
    }
  end,
  config = true,
  keys = {
    -- homerow bindings
    { '<leader>f', "<cmd>Telescope find_files<CR>", mode = { 'n' }, desc = "find files" },
    {
      '<leader>F',
      function()
        require("telescope.builtin").git_files()
      end,
      mode = { 'n' },
      desc = "Git Files"
    },
    {
      '<leader><C-f>',
      function()
        require("telescope.builtin").oldfiles()
      end,
      mode = { 'n' },
      desc = "Search Recently Opened Files"
    },
    {
      '<leader>b',
      function()
        require("telescope.builtin").buffers()
      end,
      mode = { 'n' },
      desc = "switch to open buffer"
    },
    {
      '<leader>l',
      function()
        require("telescope.builtin").current_buffer_fuzzy_find()
      end,
      mode = { 'n' },
      desc = "live grep"
    },
    {
      '<leader>a',
      function()
        require("telescope.builtin").grep_string()
      end,
      mode = { 'n' },
      desc = "search string under cursor"
    },
    {
      '<leader>g',
      function()
        require("telescope.builtin").live_grep()
      end,
      mode = { 'n' },
      desc = "live update search in telescope specific string"
    },
    {
      '<leader>m',
      function()
        require("telescope.builtin").marks()
      end,
      mode = { 'n' },
      desc = "Search Marks, saved locations"
    },
    {
      '<leader>j',
      function()
        require("telescope.builtin").jumplist()
      end,
      mode = { 'n' },
      desc = "Search Marks, saved locations"
    },
    {
      "<leader><C-j>",
      function()
        require("telescope.builtin").commands()
      end,
      mode = { 'n' },
      desc = "Search available commands"
    },
    {
      '<leader>h',
      function()
        require("telescope.builtin").help_tags()
      end,
      mode = { 'n' },
      desc = "Search builtin docs"
    },
    {
      '<leader>H',
      function()
        require("telescope.builtin").man_pages()
      end,
      mode = { 'n' },
      desc = "Man Pages"
    },
    {
      '<leader>T',
      function()
        require("telescope.builtin").tags()
      end,
      mode = { 'n' },
      desc = "Search Ctags"
    },

    {
      '<leader>qc',
      function()
        require("telescope.builtin").colorscheme()
      end,
      mode = { 'n' },
      desc = "switch colorscheme"
    },
    {
      '<leader>S',
      function()
        require("telescope.builtin").spell_suggest()
      end,
      mode = { 'n' },
      desc = "Spell Suggest"
    },
  }
}
