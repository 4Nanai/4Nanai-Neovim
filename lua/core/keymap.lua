vim.g.mapleader = " "
vim.g.maplocalleader = ","

local is_vscode = vim.g.vscode ~= nil
if not is_vscode then
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
	vim.keymap.set({ "n", "i" }, "<C-Z>", "<Cmd>redo<CR>", { silent = true })
end

-- vscode keymaps
if is_vscode then
	local vscode = require("vscode")
	local function vsc(lhs, action, desc)
		vim.keymap.set("n", lhs, function()
			vscode.action(action)
		end, { desc = desc })
	end
	vsc("<leader>bh", "workbench.action.previousEditor", "Prev Editor")
	vsc("<leader>bl", "workbench.action.nextEditor", "Next Editor")
	vsc("<leader>bp", "workbench.action.quickOpen", "Quick Open (Pick)")
	vsc("<leader>bd", "workbench.action.closeActiveEditor", "Close Editor")

	-- Split View Controls (VS Code Actions)
	vsc("<leader>wv", "workbench.action.splitEditorRight", "Split Vertical")
	vsc("<leader>ws", "workbench.action.splitEditorDown", "Split Horizontal")
	vsc("<leader>wc", "workbench.action.closeActiveEditor", "Close Window")
	vsc("<leader>wo", "workbench.action.closeEditorsInOtherGroups", "Close Others")

	-- Window Navigation (Focus Groups)
	vsc("<leader>wh", "workbench.action.focusLeftGroup", "Focus Left")
	vsc("<leader>wj", "workbench.action.focusBelowGroup", "Focus Below")
	vsc("<leader>wk", "workbench.action.focusAboveGroup", "Focus Above")
	vsc("<leader>wl", "workbench.action.focusRightGroup", "Focus Right")

	-- Lsp
	vsc("<leader>lf", "editor.action.formatDocument", "Format Document")
	-- TODO: Add more LSP actions
end
