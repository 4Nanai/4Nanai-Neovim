local is_vscode = vim.g.vscode ~= nil

return {
    "MagicDuck/grug-far.nvim",
    cmd = "GrugFar",
    cond = not is_vscode,
    opts = {},
}
