local is_vscode = vim.g.vscode ~= nil

return {
	"akinsho/bufferline.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
    cond = not is_vscode,
	opts = {
		options = {
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(_, _, diagnostics_dict, _)
				local indicator = " "
				for level, number in pairs(diagnostics_dict) do
					local symbol
					if level == "error" then
						symbol = ""
					elseif level == "warning" then
						symbol = ""
					else
						symbol = ""
					end
					indicator = indicator .. number .. symbol
				end
				return indicator
			end,
		},
	},
	keys = {
		{ "<leader>bh", ":BufferLineCyclePrev<CR>", silent = true, desc = "Buffer Left" },
		{ "<leader>bl", ":BufferLineCycleNext<CR>", silent = true, desc = "Buffer Right" },
		{ "<leader>bp", ":BufferLinePick<CR>", silent = true, desc = "Buffer Pick" },
		{ "<leader>bd", ":bdelete<CR>", silent = true, desc = "Buffer Delete" },
        { "<leader><Left>", ":BufferLineMovePrev<CR>", silent = true, desc = "Buffer Move Left" },
        { "<leader><Right>", ":BufferLineMoveNext<CR>", silent = true, desc = "Buffer Move Right" },
	},
	lazy = false,
}
