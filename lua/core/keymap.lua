vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- split view controls
vim.keymap.set("n", "<leader>wv", "<Cmd>vsplit<CR>", { silent = true })
vim.keymap.set("n", "<leader>ws", "<Cmd>split<CR>", { silent = true })
vim.keymap.set("n", "<leader>wc", "<Cmd>close<CR>")
vim.keymap.set("n", "<leader>wo", "<Cmd>only<CR>")
vim.keymap.set("n", "<leader>wh", "<Cmd>wincmd h<CR>", { silent = true })
vim.keymap.set("n", "<leader>wj", "<Cmd>wincmd j<CR>", { silent = true })
vim.keymap.set("n", "<leader>wk", "<Cmd>wincmd k<CR>", { silent = true })
vim.keymap.set("n", "<leader>wl", "<Cmd>wincmd l<CR>", { silent = true })

-- redo and undo
vim.keymap.set({ "n", "i" }, "<C-z>", "<Cmd>undo<CR>", { silent = true })
vim.keymap.set({ "n", "i" }, "<C-r>", "<Cmd>redo<CR>", { silent = true })
vim.keymap.set( "n", "u", "<Nop>", { noremap = true, silent = true })

-- toggleterm
vim.keymap.set("t", "<esc><esc>", [[<C-\><C-n>]], { silent = true })
