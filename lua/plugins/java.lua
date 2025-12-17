return {
	"mfussenegger/nvim-jdtls",
	ft = "java",
	config = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "java",
			callback = function()
				local config = {
					cmd = { "jdtls" },
					root_dir = vim.fs.root(0, { "mvnw", "gradlew", "pom.xml", "build.gradle" })
						or vim.fn.expand("%:p:h"),
				}
				require("jdtls").start_or_attach(config)
			end,
		})
	end,
}
