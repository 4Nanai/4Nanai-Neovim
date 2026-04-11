return {
	"nvimdev/lspsaga.nvim",
	cmd = "Lspsage",
	opts = {
		finder = {
			keys = {
				toggle_or_open = "<CR>",
			},
		},
        lightbulb = {
            enable = false,
            sign = false,
            debounce = 10,
        }
	},
	keys = {
		{ "<leader>lr", ":Lspsaga rename<CR>", desc = "Rename variable" },
		{ "<leader>lc", ":Lspsaga code_action<CR>", desc = "Code action" },
		{ "<leader>ld", ":Lspsaga goto_definition<CR>", desc = "Go to definition" },
		{ "<leader>lh", ":Lspsaga hover_doc<CR>", desc = "Hover document" },
		{ "<leader>lR", ":Lspsaga finder<CR>", desc = "Finder" },
		{ "<leader>ln", ":Lspsaga diagnostic_jump_next<CR>", desc = "Next error" },
		{ "<leader>lp", ":Lspsaga diagnostic_jump_prev<CR>", desc = "Prev error" },
	},
}
