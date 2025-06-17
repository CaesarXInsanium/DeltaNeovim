-- help docs: lua-ref, nvim-manual, lua-guide
-- TODO sdas
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
vim.opt.cp = false
vim.opt.guifont = "Iosevka Nerd Font:h15"
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
vim.opt.cursorcolumn = true
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

-------------------------------------------------------------------------------
-- Variables ------------------------------------------------------------------
-------------------------------------------------------------------------------
vim.g.neovide_opacity = 0.90
vim.g.transparency = 0.9
vim.g.markdown_fenced_languages = require("languages")
vim.g.vim_markdown_auto_insert_bullets = 0
vim.g.vim_markdown_new_list_item_indent = 2
vim.g.markdown_recommended_style = 0
vim.g.markdown_folding = 0
vim.g.vim_markdown_conceal = 1
-- disable stupid Toc shrinking
vim.g.vim_markdown_toc_autofit = 0
vim.g.ft_man_open_mode = "tab"
vim.g.asynrun_open = true

vim.g.asciidoctor_fenced_languages = require("languages")

-------------------------------------------------------------------------------
-- Autocmds -------------------------------------------------------------------
-------------------------------------------------------------------------------

vim.cmd([[au FileType rust,vimscript set mps+=<:>]])
vim.cmd([[au FileType lisp,scheme set mps-=':']])
vim.cmd([[au BufWinEnter *.sls set ft=scheme]])
vim.cmd([[au BufWinEnter Akku.manifest set ft=scheme]])
vim.cmd("colorscheme gruvbox")

-------------------------------------------------------------------------------
-- LSP ------------------------------------------------------------------------
-------------------------------------------------------------------------------
vim.lsp.enable("lua-language-server")
vim.lsp.enable("clangd")
vim.diagnostic.config({
	virtual_text = { current_line = true },
})

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = false })
		end

		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
		vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
		vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
		vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
		vim.keymap.set("n", "<F5>", "<cmd>lua vim.diagnostic.enable(false)<cr>", opts)
		vim.keymap.set("n", "<F6>", "<cmd>lua vim.diagnostic.enable(true)<cr>", opts)
	end,
})
