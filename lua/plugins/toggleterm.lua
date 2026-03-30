local is_vscode = vim.g.vscode ~= nil

return {
    "akinsho/toggleterm.nvim",
    version = "*",
    cond = not is_vscode,
    opts = {
        size = 20,
        open_mapping = [[<C-\>]],
        direction = "float",
        close_on_exit = true,
    },
    event = "VeryLazy",
}
