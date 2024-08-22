return {
    "mrcjkb/haskell-tools.nvim",
    lazy = false,
    init = function()
        vim.g.haskell_tools = {
            hls = {
                settings = {
                    plugin = {
                        ["ghcide-completions"] = {
                            config = {
                                snippetsOn = false,
                                autoExtendOn = true
                            }
                        }
                    }
                }
            }
        }
    end
}
