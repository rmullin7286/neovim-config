return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    opts = {
        tabline = {
            lualine_a = {
                {
                    "buffers",
                    use_mode_colors = true,
                    symbols = {
                        alternate_file = ""
                    }
                }
            }
        }
    }
}
