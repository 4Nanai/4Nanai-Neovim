local is_vscode = vim.g.vscode ~= nil

return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	keys = { -- Example mapping to toggle outline
		{ "<leader>uo", "<cmd>Outline<CR>", desc = "Toggle outline" },
	},
    cond = not is_vscode,
	opts = {
		-- Your setup opts here
	},
}
