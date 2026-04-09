local autocmd = vim.api.nvim_create_autocmd
local opts = { noremap = true, silent = true }

autocmd("FileType", {
	pattern = "python",
	callback = function(event)
		vim.keymap.set("n", "<C-c>", ":vsplit<CR>:te python3 '%'<CR>i", vim.tbl_extend("force", opts, { buffer = event.buf }))
	end,
})
autocmd("FileType", {
	pattern = "cpp",
	callback = function(event)
		vim.keymap.set("n", "<C-c>", ":vsplit<CR>:te g++ -std=c++14 -Wshadow -Wall % -g -D_GLIBCXX_DEBUG && ./a.out<CR>i", vim.tbl_extend("force", opts, { buffer = event.buf }))
	end,
})
autocmd("FileType", {
	pattern = "c",
	callback = function(event)
		vim.keymap.set("n", "<C-c>", ":vsplit<CR>:te gcc -Wshadow -Wall % -g -D_GLIBCXX_DEBUG && ./a.out<CR>i", vim.tbl_extend("force", opts, { buffer = event.buf }))
	end,
})
autocmd("FileType", {
	pattern = "rust",
	callback = function(event)
		vim.keymap.set("n", "<C-c>", ":vsplit<CR>:te rustc % -g && ./%:t:r<CR>i", vim.tbl_extend("force", opts, { buffer = event.buf }))
	end,
})
autocmd("FileType", {
	pattern = "javascript",
	callback = function(event)
		vim.keymap.set("n", "<C-c>", ":vsplit<CR>:te node '%' <CR>i", vim.tbl_extend("force", opts, { buffer = event.buf }))
	end,
})
autocmd("FileType", {
	pattern = "go",
	callback = function(event)
		vim.keymap.set("n", "<C-c>", ":vsplit<CR>:te go run . <CR>i", vim.tbl_extend("force", opts, { buffer = event.buf }))
	end,
})
autocmd("FileType", {
	pattern = "java",
	callback = function(event)
		vim.keymap.set("n", "<C-c>", ":vsplit<CR>:te javac % && java " .. vim.fn.expand("%:t:r") .. "<CR>i", vim.tbl_extend("force", opts, { buffer = event.buf }))
	end,
})
