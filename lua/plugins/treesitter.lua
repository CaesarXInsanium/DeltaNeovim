return {
	"nvim-treesitter/nvim-treesitter",
	version = false, -- last release is way too old and doesn't work on Windows
	build = ":TSUpdate",
	lazy = false,
	dependencies = {
		"https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
	},
	init = function(plugin)
		-- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
		-- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
		-- no longer trigger the **nvim-treesitter** module to be loaded in time.
		-- Luckily, the only things that those plugins need are the custom queries, which we make available
		-- during startup.
		require("lazy.core.loader").add_to_rtp(plugin)
		require("nvim-treesitter.query_predicates")
	end,
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	keys = {
		{ "<c-space>", desc = "Increment Selection" },
		{ "<bs>", desc = "Decrement Selection", mode = "x" },
	},
	opts_extend = { "ensure_installed" },
	---@type TSConfig
	---@diagnostic disable-next-line: missing-fields
	opts = {
		highlight = { enable = true },
		indent = { enable = true },
		ignore_install = { "org" },
		ensure_installed = {
			"bash",
			"c",
			"diff",
			"html",
			"javascript",
			"jsdoc",
			"json",
			"jsonc",
			"lua",
			"luadoc",
			"luap",
			"markdown",
			"markdown_inline",
			"printf",
			"scheme",
			"clojure",
			"commonlisp",
			"hare",
			"odin",
			"nim",
			"python",
			"query",
			"regex",
			"toml",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"xml",
			"yaml",
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
		textobjects = {
			swap = {
				enable = true,
				swap_next = {
					["<C-s>a"] = "@parameter.inner",
				},
				swap_previous = {
					["<C-a>A"] = "@parameter.inner",
				},
			},
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					["]m"] = "@function.outer",
					-- ["]]"] = { query = "@class.outer", desc = "Next class start" },
					--
					-- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queries.
					["]o"] = "@loop.*",
					-- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
					--
					-- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
					-- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
					["]s"] = { query = "@local.scope", query_group = "locals", desc = "Next scope" },
					["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
				},
				goto_next_end = {
					["]M"] = "@function.outer",
					-- ["]["] = "@class.outer",
				},
				goto_previous_start = {
					["[m"] = "@function.outer",
					-- ["[["] = "@class.outer",
				},
				goto_previous_end = {
					["[M"] = "@function.outer",
					-- ["[]"] = "@class.outer",
				},
				-- Below will go to either the start or the end, whichever is closer.
				-- Use if you want more granular movements
				-- Make it even more gradual by adding multiple queries and regex.
				goto_next = {
					["]D"] = "@conditional.outer",
				},
				goto_previous = {
					["[D"] = "@conditional.outer",
				},
			},
		},
	},
	---@param opts TSConfig
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
