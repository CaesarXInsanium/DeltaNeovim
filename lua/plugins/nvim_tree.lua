return {
	"https://github.com/nvim-tree/nvim-tree.lua.git",
	lazy = false,
	dependencies = {
		"https://github.com/nvim-tree/nvim-web-devicons",
	},
	opts = {
		sort = {
			sorter = "case_sensitive",
		},
		view = {
			width = 30,
		},
		renderer = {
			group_empty = true,
		},
		filters = {
			dotfiles = true,
		},
	},
	keys = {
		{ "<leader>t", "<cmd>NvimTreeToggle<CR>", mode = { "n" }, desc = "Nvim Tree Toggle" },
	},
}
