local keymap = vim.keymap

-- Easy Navigation
keymap.set("i", "jk", "<Esc>", {})
keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Escape Cases
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear the highlighting" })
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Stay in Indent Mode
keymap.set("v", "<", "<gv", { desc = "Move left in visual mode" })
keymap.set("v", ">", ">gv", { desc = "Move right in visual mode" })
keymap.set("x", "J", ":move '>+1<CR>gv-gv", { desc = "Move down in visual block" })
keymap.set("x", "K", ":move '<-2<CR>gv-gv", { desc = "Move up in visual block" })

-- Split Window
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "[S]plit window [V]ertically" })
keymap.set("n", "<leader>sz", "<C-w>s", { desc = "[S]plit window hori[Z]ontally" })

-- Buffers
keymap.set("n", "<S-h>", ":bp<CR>", { desc = "Go to previous buffer" })
keymap.set("n", "<S-l>", ":bn<CR>", { desc = "Go to next buffer" })
keymap.set("n", "<leader>q", ":bd<CR>", { desc = "Close buffer" })
keymap.set("n", "<leader>l", ":ls<CR>", { desc = "[L]ist buffers" })
