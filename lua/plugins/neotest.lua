return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "williamboman/mason.nvim"
    },
    config = function()
        -- require('mason').setup({})
        require('neotest').setup({
            adapters = {
                require('rustaceanvim.neotest')
            }
        })
    end,
}
