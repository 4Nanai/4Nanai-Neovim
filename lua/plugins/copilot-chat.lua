local is_vscode = vim.g.vscode ~= nil

return {
	"CopilotC-Nvim/CopilotChat.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim", branch = "master" },
		{ "nvim-telescope/telescope.nvim", branch = "master" },
	},
	build = "make tiktoken",
	cond = not is_vscode,
	opts = {},
}
