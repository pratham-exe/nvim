return {
	"stevearc/conform.nvim",
	event = { "BufReadPre" },
	cmd = { "ConformInfo" },
	opts = {
		notify_on_error = false,
		-- All auto-formatting disabled. Use project tooling instead:
		--   backend  → mvn spotless:apply
		--   frontend → npx prettier --write (or your IDE/CI)
		format_on_save = false,
		formatters_by_ft = {},
	},
}
