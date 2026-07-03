-- help docs: lua-ref, nvim-manual, lua-guide
-------------------------------------------------------------------------------
-- Before Plugins --------------------------------------------------------------------
-------------------------------------------------------------------------------
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-------------------------------------------------------------------------------
-- Plugins --------------------------------------------------------------------
-------------------------------------------------------------------------------
vim.g.mapleader = " "
vim.g.localleader = " "

require("manager")
-- retarded
-------------------------------------------------------------------------------
-- Options --------------------------------------------------------------------
-------------------------------------------------------------------------------
vim.g.neovide_opacity = 0.97
vim.opt.cp = false
vim.opt.clipboard = { "unnamedplus" }
-- lualine is installed
vim.opt.showmode = false
vim.opt.conceallevel = 2

vim.opt.rnu = true
vim.opt.nu = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.wrap = false

vim.opt.history = 666
vim.opt.timeout = true
vim.opt.timeoutlen = 3000
-- esc not wait too long
vim.opt.ttimeoutlen = 100
vim.opt.backspace = { "indent", "eol", "start", "nostop" }

vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

vim.opt.shell = "bash"

vim.opt.backup = false
vim.opt.backupext = ".bak"

vim.opt.colorcolumn = { 80 }
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
vim.opt.ruler = true

-- vim.opt.conceallevel = 2

vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.opt.sessionoptions = { "blank", "buffers", "curdir", "folds", "help", "tabpages", "winsize", "terminal" }
vim.opt.spelllang = { "en_us", "en" }
vim.opt.spell = false
vim.opt.dictionary = { "spell" }
vim.opt.wildmenu = true
vim.opt.wildoptions = { "fuzzy", "pum", "tagfile" }
-- let us go with the default option since it is less painful
-- vim.opt.tag = { "./tags", "tags"}
--  :help omnifunc
-- :help completion
vim.opt.completeopt = { "fuzzy", "menu", "menuone", "popup", "noselect", "noinsert", "preview" }
vim.opt.laststatus = 3

-------------------------------------------------------------------------------
-- Variables ------------------------------------------------------------------
-------------------------------------------------------------------------------
vim.g.asciidoctor_fenced_languages = require("languages")
vim.g.asynrun_open = true
vim.g.c_syntax_for_h = 0
vim.g.filetype_md = "pandoc"

-------------------------------------------------------------------------------
-- Autocmds -------------------------------------------------------------------
-------------------------------------------------------------------------------

vim.cmd([[au FileType rust,vimscript set mps+=<:>]])
vim.cmd([[au FileType lisp,scheme set mps-=':']])
vim.cmd([[au BufWinEnter *.sls set ft=scheme]])
vim.cmd([[au BufWinEnter Akku.manifest set ft=scheme]])

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.c", "*h", "*.rs" },
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
vim.cmd("colorscheme everforest")

-------------------------------------------------------------------------------
-- Treesitter -----------------------------------------------------------------
-------------------------------------------------------------------------------

-- vim.treesitter.language.add("python", { path = "/path/to/python.so" })
vim.treesitter.language.register('markdown', {  'pandoc' })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "c",
	callback = function(ev)
		vim.treesitter.start(ev.buf, "c")
		vim.bo[ev.buf].syntax = "ON" -- only if additional legacy syntax is needed
	end,
})
