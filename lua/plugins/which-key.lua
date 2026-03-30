local is_vscode = vim.g.vscode ~= nil

return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    cond = not is_vscode,
    config = function (_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        wk.add({
            { "<leader>l", group = "lsp" },
            { "<leader>b", group = "buffer" },
            { "<leader>h", group = "hop" },
            { "<leader>u", group = "utils" },
            { "<leader>g", group = "git" },
            { "<leader>w", group = "window" },
        })
    end,
    keys = {
        {
            "<leader>?",
            function ()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        }
    }
}
