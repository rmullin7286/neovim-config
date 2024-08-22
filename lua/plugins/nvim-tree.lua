return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" }
    },
    lazy = false,
    config = function()
        require("nvim-tree").setup({
            actions = {
                open_file = {
                    quit_on_open = true
                }
            }
        })
        vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>")
    end
}
