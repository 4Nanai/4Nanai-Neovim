local is_vscode = vim.g.vscode ~= nil

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cond = not is_vscode,
    opts = {
        actions = {
            open_file = {
                quit_on_open = true
            }
        }
    },
    keys = {
        { "<leader>uf", ":NvimTreeToggle<CR>", silent = true, desc = "Toggle Tree View" },
    }
}
