return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"folke/neodev.nvim",
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("grn", vim.lsp.buf.rename, "Rename")
				map("gra", vim.lsp.buf.code_action, "Goto Code Action", { "n", "x" })
				map("grr", function()
					require("telescope.builtin").lsp_references({
						layout_strategy = "horizontal",
						layout_config = {
							width = 0.9,
							height = 0.9,
							preview_width = 0.5,
						},
					})
				end, "Goto References")
				map("gri", require("telescope.builtin").lsp_implementations, "Goto Implementation")
				map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
				map("grd", require("telescope.builtin").lsp_definitions, "Goto Definition")
				map("grD", vim.lsp.buf.declaration, "Goto Declaration")
				map("gO", require("telescope.builtin").lsp_document_symbols, "Open Document Symbols")
				map("grt", require("telescope.builtin").lsp_type_definitions, "Goto Type Definition")
			end,
		})

		vim.diagnostic.config({
			virtual_text = false,
			underline = false,
			signs = true,
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
				["lua_ls"] = function()
					require("lspconfig")["lua_ls"].setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								completion = {
									callSnippet = "Replace",
								},
								diagnostics = {
									globals = { "vim" },
									disable = { "missing-fields" },
								},
							},
						},
					})
				end,
			},
		})
	end,
}
