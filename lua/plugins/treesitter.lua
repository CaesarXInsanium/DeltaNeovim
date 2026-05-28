return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master", -- master is locked, main branch is major rewrite
	pin = true,
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({
			"bash",

			"elm",
			"haskell",
			"printf",

			"scheme",
			"clojure",
			"commonlisp",

			"c",
			"c3",
			"hare",
			"odin",
			"nim",
			"zig",

			"lua",
			"luadoc",
			"luap",
			"python",
			"toml",
			"tsx",
			"typescript",

			"vim",
			"vimdoc",

			"diff",
			"query",
			"regex",
			"xml",
			"yaml",
			"html",

			"typst",
			"markdown",
			"markdown_inline",
		})
	end,
}
