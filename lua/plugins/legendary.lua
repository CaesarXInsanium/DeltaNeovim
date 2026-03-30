return {
	"mrjones2014/legendary.nvim",
	lazy = false,
	keys = {
		-- Here will Lie mostly built in features
		{
			"<leader>qk",
			"<cmd>Telescope keymaps<CR>",
			mode = { "n" },
			desc = "show keybindings",
		},
		{ "<leader>ql", "<cmd>Lazy<CR>", mode = { "n" }, desc = "Lazy Panel" },
		{
			"<leader>qh",
			"<cmd>set nohlsearch<CR>",
			mode = { "n" },
			desc = "hide search highlighting",
		},
		{
			"<leader>qb",
			"<cmd>hi Normal guibg=NONE ctermbg=NONE<CR>",
			mode = { "n" },
			desc = "set clear background",
		},
		{
			"<leader>ql",
			"<cmd>set background=light<CR>",
			mode = { "n" },
			desc = "switch to light mode",
		},
		{
			"<leader>qL",
			"<cmd>set background=dark<CR>",
			mode = { "n" },
			desc = "switch to light mode",
		},

		{ "<leader>ss", "<cmd>mksession! .session<CR>", mode = { "n" }, desc = "Save Session" },
		{ "<leader>sl", "<cmd>source .session<CR>", mode = { "n" }, desc = "Load Session" },
		{
			"<leader>sr",
			"<cmd>!rm .session<CR>",
			mode = { "n" },
			desc = "Delete Session",
		},

		-- Tab Movement
		{ "<leader><leader>", ":tab split<CR>", mode = { "n" }, desc = " Tab" },
		{ "<leader>`", ":tabnew<CR>", mode = { "n" }, desc = "New Tab" },
		{ "<leader><Backspace>", ":tabclose<CR>", mode = { "n" }, desc = "Tab Close" },
		{ "<leader>1", ":tabn 1<CR>", mode = { "n" }, desc = "Tab 1" },
		{ "<leader>2", ":tabn 2<CR>", mode = { "n" }, desc = "Tab 2" },
		{ "<leader>3", ":tabn 3<CR>", mode = { "n" }, desc = "Tab 3" },
		{ "<leader>4", ":tabn 4<CR>", mode = { "n" }, desc = "Tab 4" },
		{ "<leader>5", ":tabn 5<CR>", mode = { "n" }, desc = "Tab 5" },
		{ "<leader>6", ":tabn 6<CR>", mode = { "n" }, desc = "Tab 6" },
		{ "<leader>7", ":tabn 7<CR>", mode = { "n" }, desc = "Tab 7" },
		{ "<leader>8", ":tabn 8<CR>", mode = { "n" }, desc = "Tab 8" },
		{ "<leader>9", ":tabn 9<CR>", mode = { "n" }, desc = "Tab 9" },
		{ "<leader>0", ":tabn 0<CR>", mode = { "n" }, desc = "Tab 0" },

		-- Quickfix
		{ "<leader>c", "<cmd>copen<CR>", mode = { "n" }, desc = "Open Quickfix" },
		{
			"<leader>C",
			"<cmd>cclose<CR>",
			mode = { "n" },
			desc = "Close Quickfix",
		},
	},
	config = function()
		require("legendary").setup({ extensions = { lazy_nvim = { auto_register = true } } })
	end,
}
