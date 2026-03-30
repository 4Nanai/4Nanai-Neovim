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
	local function vsc_normal(lhs, action, desc)
		vim.keymap.set("n", lhs, function()
			vscode.action(action)
		end, { desc = desc })
	end
	local function vsc_insert(lsh, action)
		vim.keymap.set("i", lsh, function()
			vscode.action(action)
		end)
	end
	local function vsc_mode(mode, lsh, action)
		vim.keymap.set(mode, lsh, function()
			vscode.action(action)
		end)
	end
	vsc_normal("<leader>bh", "workbench.action.previousEditor", "Prev Editor")
	vsc_normal("<leader>bl", "workbench.action.nextEditor", "Next Editor")
	vsc_normal("<leader>bp", "workbench.action.quickOpen", "Quick Open (Pick)")
	vsc_normal("<leader>bd", "workbench.action.closeActiveEditor", "Close Editor")

	-- Split View Controls (VS Code Actions)
	vsc_normal("<leader>wv", "workbench.action.splitEditorRight", "Split Vertical")
	vsc_normal("<leader>ws", "workbench.action.splitEditorDown", "Split Horizontal")
	vsc_normal("<leader>wc", "workbench.action.closeActiveEditor", "Close Window")
	vsc_normal("<leader>wo", "workbench.action.closeEditorsInOtherGroups", "Close Others")

	-- Window Navigation (Focus Groups)
	vsc_normal("<leader>wh", "workbench.action.focusLeftGroup", "Focus Left")
	vsc_normal("<leader>wj", "workbench.action.focusBelowGroup", "Focus Below")
	vsc_normal("<leader>wk", "workbench.action.focusAboveGroup", "Focus Above")
	vsc_normal("<leader>wl", "workbench.action.focusRightGroup", "Focus Right")

	-- Lsp
	vsc_normal("<leader>lf", "editor.action.formatDocument", "Format Document")
	vsc_normal("<leader>uf", "workbench.view.explorer", "Toggle File Explorer")
	vsc_insert("<C-\\>", "workbench.action.terminal.toggleTerminal")
	vsc_mode({ "n", "i" }, "<leader>uc", "workbench.action.chat.openagent")
end
