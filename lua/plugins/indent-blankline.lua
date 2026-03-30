local is_vscode = vim.g.vscode ~= nil

return {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    main = "ibl",
    cond = not is_vscode,
    opts = {},
}
