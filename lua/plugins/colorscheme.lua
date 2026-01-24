return {
	"ellisonleao/gruvbox.nvim",
	name = "gruvbox",
	config = function()
		vim.o.background = "dark"
		require("gruvbox").setup({
			contrast = "hard",
		})
		vim.cmd.colorscheme("gruvbox")
	end,
}
