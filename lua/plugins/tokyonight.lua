return {
    "folke/tokyonight.nvim",
    opts = {
        style = "moon",
        on_highlights = function (hl, c)
            local LineNrColor = "#8389a3"

            hl.LineNr = {
                fg = "#8389a3",
            }
            hl.LineNrAbove = {
                fg = LineNrColor,
            }
            hl.LineNrBelow = {
                fg = LineNrColor,
            }
        end,
    },
    config = function(_, opts)
        require("tokyonight").setup(opts)
        vim.cmd("colorscheme tokyonight")
    end
}
