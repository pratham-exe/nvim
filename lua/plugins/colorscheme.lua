return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			integrations = {
				treesitter = true,
				native_lsp = { enabled = true },
				telescope = { enabled = true },
				gitsigns = true,
				nvimtree = true,
				mason = true,
				cmp = true,
				which_key = true,
				bufferline = true,
				lualine = true,
			},
		})
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
