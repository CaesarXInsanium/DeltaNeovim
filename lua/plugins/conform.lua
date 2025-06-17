return {
	"stevearc/conform.nvim",
	opts = {
		format_on_save = {
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			rust = { "rustfmt", lsp_format = "fallback" },
			java = {
				"clang-format",
			},
		},
	},
}
