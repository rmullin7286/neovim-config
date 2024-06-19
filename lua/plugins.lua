-- This module defines all of the plugins I use to make neovim a full fledged code editor.

return {
    -- This is the colorscheme I'm currently using.
    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha"
            })
            vim.cmd.colorscheme "catppuccin"
        end
    },
    -- autocompletion
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/nvim-cmp" },
    -- code snippets. To be honest I haven't actually used this much yet...
    { "L3MON4D3/LuaSnip" },
    -- lsp-config is what does the heavy lifting to setup language servers. There are a few caveats though. Some
    -- languages, like Haskell, prefer that you don't setup the LSP here but in a separate plugin instead, so those will
    -- be skipped.
    { "neovim/nvim-lspconfig" },
    -- Mason can be used to install lsps, formatters, and linters on the fly.
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    -- lsp-zero is a plugin I found useful to autoconfigure a lot of language server stuff for me. I may remove this in
    -- the future and just do it myself though.
    {
        "VonHeikemen/lsp-zero.nvim",
        lazy = false,
        config = function()
            local lsp_zero = require("lsp-zero")
            local lspconfig = require("lspconfig")

            lsp_zero.on_attach(function(_, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
                lsp_zero.buffer_autoformat()
            end)

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls"
                },
                handlers = {
                    -- default handler
                    function(server_name)
                        if server_name ~= "hls" then
                            lspconfig[server_name].setup({})
                        end
                    end,
                    lua_ls = function()
                        lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())
                    end
                }
            })
        end
    },
    -- adds auto closing pairs for (), {}, <>, "", etc.
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true
    },
    -- adds a file tree browser. Prefer fuzzy finding with telescope, but this can be used if it's more convenient.
    {
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
            vim.keymap.set("n", "<leader>e", "NvimTreeToggle<cr>")
        end
    },
    -- adds a nicer status line, as well as "tabs" for each open buffer.
    {
        "nvim/lualine/lualine.nvim",
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
    },
    -- telescope is a pop-up fuzzy finder that can help with various search operations
    {
        "nvim-telescope/telescope.nvim",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
        end
    },
    -- This plugin is specifically for working with Haskell.
    {
        "mrcjkb/haskell-tools.nvim",
        lazy = false
    }
}
