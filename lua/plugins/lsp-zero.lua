return {
    "VonHeikemen/lsp-zero.nvim",
    lazy = false,
    dependencies = {
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/nvim-cmp" },
        { "neovim/nvim-lspconfig" },
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" }
    },
    config = function()
        local lsp_zero = require("lsp-zero")
        lsp_zero.extend_lspconfig()

        lsp_zero.on_attach(function(_, bufnr)
            lsp_zero.default_keymaps({ buffer = bufnr })
            lsp_zero.buffer_autoformat()
        end)

        local lspconfig = require("lspconfig")

        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls"
            },
            handlers = {
                function(server_name)
                    lspconfig[server_name].setup({})
                end,
                lua_ls = function()
                    lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())
                end
            }
        })
    end
}