return {
	"vyfor/cord.nvim",
	opts = {
		idle = {
			enabled = true,
			timeout = 10800000, -- 3 hours in milliseconds
			show_status = true,
			ignore_focus = true,
			unidle_on_focus = true,
			smart_idle = true,
			details = "Taking a break from coding",
			state = nil,
			tooltip = "💤",
			icon = nil,
		},
		text = {
			workspace = function(opts)
				local has_repo = opts.repo_url ~= nil
				if has_repo then
					-- 移除 https://github.com/ 或其他 hostname
					-- %w+ 表示匹配字母和数字，.- 表示非贪婪匹配
					local clean_url = opts.repo_url:gsub("https?://[^/]+/", "")

					return "In " .. opts.workspace .. " 🌿 " .. clean_url
				end
				return "In " .. opts.workspace
			end,
			editing = function(opts)
				return "Editing " .. opts.filename .. "[Line " .. opts.cursor_line .. "]"
			end,
		},
		buttons = {
			{
				label = "View Repository",
				url = function(opts)
					return opts.repo_url
				end,
			},
		},
	},
}
