return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup({
			git = {
				ignore = false,
			},
			view = {
				width = {
					min = 50,
					max = 100,
				},
			},
		})
	end,
}
