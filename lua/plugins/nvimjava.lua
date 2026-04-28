return {
	"nvim-java/nvim-java",
	-- Load eagerly so nvim-java registers its enriched jdtls config (bundles +
	-- lombok + spring-boot + bundled JDK) BEFORE the first Java buffer's
	-- FileType event fires.
	lazy = false,
	priority = 1000,
	config = function()
		require("java").setup()
		vim.lsp.enable("jdtls")

		-- vim.lsp.enable() registers a FileType hook for FUTURE buffers.
		-- Re-fire FileType for any Java buffers already open (session restore,
		-- file passed as nvim arg, etc.) so jdtls attaches to them too.
		vim.schedule(function()
			for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
				if vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].filetype == "java" then
					vim.api.nvim_exec_autocmds("FileType", {
						buffer = bufnr,
						pattern = "java",
					})
				end
			end
		end)
	end,
}
