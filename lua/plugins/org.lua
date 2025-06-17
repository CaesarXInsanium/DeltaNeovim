return {
	"nvim-orgmode/orgmode",
	event = "VeryLazy",
	ft = { "org" },
	opts = {
		org_todo_keywords = { "TODO", "WAITING", "DONE", "DELAGATED" },
		org_agenda_files = "~/Org/**/*",
		org_default_notes_file = "~/Org/Notes.org",
		org_startup_indented = false,
		-- this stupid setting cause me so much fucking CRINGE. It made me have to read the
		-- DOCUMENTATION
		org_adapt_indentation = false,
		-- where to put arbitary notes
		-- org_archive_location
	},
	config = function(opts)
		-- Setup orgmode
		require("orgmode").setup(opts)
	end,
	keys = {
		{
			"<S-CR",
			'<cmd>lua require("orgmode").action("org_mappings.meta_return")<CR>',
			mode = { "i" },
			desc = "Org Meta Return",
		},
	},
}
