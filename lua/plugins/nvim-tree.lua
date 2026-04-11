return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        actions = {
            open_file = {
                quit_on_open = true
            }
        },
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
            enable = true,
            update_root = {
                enable = false,
                ignore_list = {},
            }
        },
        filters = {
            git_ignored = false,
            dotfiles = false,
            custom = {
                "^\\.git",
                "node_modules",
                ".cache",
            }
        }
    },
    keys = {
        { "<leader>uf", ":NvimTreeToggle<CR>", silent = true, desc = "Toggle Tree View" },
    }
}
