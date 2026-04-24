return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		pcall(require("telescope").load_extension, "fzf")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>sf", function()
			builtin.find_files({
				hidden = true,
				no_ignore = true,
				find_command = {
					"fd", "--type", "f", "--hidden", "--no-ignore",
					"--exclude", "node_modules",
					"--exclude", ".next",
					"--exclude", ".git",
					"--exclude", "dist",
					"--exclude", "build",
					"--exclude", ".turbo",
				},
				previewer = false,
				layout_strategy = "horizontal",
				layout_config = {
					width = 0.9,
					height = 0.9,
				},
			})
		end, { desc = "Search Files (no preview)" })
		vim.keymap.set("n", "<leader>sg", function()
			builtin.live_grep({
				previewer = false,
				layout_strategy = "horizontal",
				layout_config = {
					width = 0.9,
					height = 0.9,
					preview_width = 0.35,
				},
			})
		end, { desc = "Live Grep (no preview)" })
		vim.keymap.set("n", "<leader><leader>", function()
			builtin.buffers({
				previewer = false,
				layout_strategy = "horizontal",
				layout_config = {
					width = 0.9,
					height = 0.9,
				},
			})
		end, { desc = "Find existing buffers (no preview)" })
		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find({
				previewer = false,
				layout_strategy = "horizontal",
				layout_config = {
					width = 0.9,
					height = 0.9,
				},
			})
		end, { desc = "Fuzzy search in buffer" })
	end,
}
