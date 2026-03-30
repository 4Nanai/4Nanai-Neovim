local is_vscode = vim.g.vscode ~= nil

return {
    "NeogitOrg/neogit",
    lazy = true,
    cond = not is_vscode,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim",
    },
    cmd = "Neogit",
    keys = {
        { "<leader>gg", "<Cmd>Neogit<CR>", desc = "Show Neogit UI" },
    },
}
