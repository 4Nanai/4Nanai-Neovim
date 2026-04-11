return {
	"nickjvandyke/opencode.nvim",
	version = "*", -- Latest stable release
    event = "VeryLazy",
	dependencies = {
		{
			-- `snacks.nvim` integration is recommended, but optional
			---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
			"folke/snacks.nvim",
			optional = true,
			opts = {
				input = {}, -- Enhances `ask()`
				picker = { -- Enhances `select()`
					actions = {
						opencode_send = function(...)
							return require("opencode").snacks_picker_send(...)
						end,
					},
					win = {
						input = {
							keys = {
								["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
							},
						},
					},
				},
			},
		},
	},
	config = function()
		local opencode_window = "opencode"
		local opencode_cmd = "opencode --port"
		local function tmux_window_exists()
			local windows = vim.fn.systemlist({ "tmux", "list-windows", "-F", "#W" })
			return vim.tbl_contains(windows, opencode_window)
		end
		---@type opencode.Opts
		vim.g.opencode_opts = {
			server = {
				start = function()
					if not tmux_window_exists() then
						vim.fn.system({ "tmux", "new-window", "-d", "-n", opencode_window, opencode_cmd })
					end
				end,
				stop = function()
					if tmux_window_exists() then
						vim.fn.system({ "tmux", "kill-window", "-t", opencode_window })
					end
				end,
				toggle = function()
					if tmux_window_exists() then
						vim.fn.system({ "tmux", "select-window", "-t", opencode_window })
					else
						vim.fn.system({ "tmux", "new-window", "-n", opencode_window, opencode_cmd })
					end
				end,
			},
		}

		vim.o.autoread = true -- Required for `opts.events.reload`
		local opencode = require("opencode")
		vim.keymap.set("n", "<leader>oc", function()
			opencode.ask("@buffer: ")
		end)

		vim.keymap.set("v", "<leader>oc", function()
			opencode.ask("@this: ")
		end)
	end,
}
