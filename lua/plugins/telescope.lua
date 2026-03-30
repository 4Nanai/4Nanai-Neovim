local is_vscode = vim.g.vscode ~= nil

return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            config = function ()
                require("telescope").load_extension("fzf")
            end,
        },
    },
    cmd = "Telescope",
    cond = not is_vscode,
    opts = {
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
        },
    },
}
