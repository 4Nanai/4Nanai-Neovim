local is_vscode = vim.g.vscode ~= nil

return {

	"lewis6991/gitsigns.nvim",

	event = "VeryLazy",

    cond = not is_vscode,

	opts = {

		signs = {

			add = { text = "┃" },

			change = { text = "┃" },

			delete = { text = "_" },

			topdelete = { text = "‾" },

			changedelete = { text = "~" },

			untracked = { text = "┆" },
		},

		signs_staged = {

			add = { text = "┃" },

			change = { text = "┃" },

			delete = { text = "_" },

			topdelete = { text = "‾" },

			changedelete = { text = "~" },

			untracked = { text = "┆" },
		},

		signs_staged_enable = true,

		signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`

		numhl = false, -- Toggle with `:Gitsigns toggle_numhl`

		linehl = false, -- Toggle with `:Gitsigns toggle_linehl`

		word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`

		watch_gitdir = {

			follow_files = true,
		},

		auto_attach = true,

		attach_to_untracked = false,

		current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`

		current_line_blame_opts = {

			virt_text = true,

			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'

			delay = 1000,

			ignore_whitespace = false,

			virt_text_priority = 100,

			use_focus = true,
		},

		current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",

		sign_priority = 6,

		update_debounce = 100,

		status_formatter = nil, -- Use default

		max_file_length = 40000, -- Disable if file is longer than this (in lines)

		preview_config = {

			-- Options passed to nvim_open_win

			style = "minimal",

			relative = "cursor",

			row = 0,

			col = 1,
		},

		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")

			local function map(mode, l, r, opts)
				opts = opts or {}

				opts.buffer = bufnr

				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation

			map("n", "<leader>gn", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gitsigns.nav_hunk("next")
				end
			end, { desc = "Go to next change" })

			map("n", "<leader>gp", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end, { desc = "Go to previous change" })

			-- Actions

			map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Git Stage" })

			map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Git Reset" })

			map("v", "<leader>gs", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Git Stage" })

			map("v", "<leader>gr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Git Reset" })

			map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "Git Stage All" })

			map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Git Reset All" })

			map("n", "<leader>gc", gitsigns.preview_hunk, { desc = "Git Preview Changes" })

			map("n", "<leader>gi", gitsigns.preview_hunk_inline, { desc = "Git Preview Changes Inline" })

			map("n", "<leader>gb", function()
				gitsigns.blame_line({ full = true })
			end, { desc = "Git Blame Line" })

			map("n", "<leader>gd", gitsigns.diffthis, { desc = "Git Diff" })

			map("n", "<leader>gD", function()
				gitsigns.diffthis("~")
			end, { desc = "Git Diff Previous" })

			map("n", "<leader>gQ", function()
				gitsigns.setqflist("all")
			end, { desc = "Git Send All Hunks to QuickFix" })

			map("n", "<leader>gq", gitsigns.setqflist, { desc = "Git Send Buffer Hunks to QuickFix" })

			-- Toggles

			map("n", "<leader>gtb", gitsigns.toggle_current_line_blame, { desc = "Toggle Git Blame" })

			map("n", "<leader>gtw", gitsigns.toggle_word_diff, { desc = "Toggle Git Word Diff" })

			-- Text object

			map({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "Select Hunk" })
		end,
	},
}
