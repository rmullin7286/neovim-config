-- set the leader key to space.
vim.g.mapleader = " "

-- bootstraps lazy.nvim
-- lazy.nvim is the package manager I use for all of my plugins.
-- All plugins are defined in lua/plugins.lua. I used to split them
-- up in different files but I found I don't use enough to justify that
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    print("downloading lazy.nvim")
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

-- allow yanking and pasting to/from the system clipboard
vim.opt.clipboard:append { 'unnamed', 'unnamedplus' }

-- set colorscheme
vim.cmd.colorscheme "catppuccin"

-- set lines to automatically wrap at 120 characters.
vim.opt.wrap = true
vim.opt.textwidth = 120

-- keybindings
--
-- These bindings cycle through buffers, which will be displayed as
-- tabs at the top of the editor.
vim.keymap.set("n", "<Tab>", ":bnext<cr>")
vim.keymap.set("n", "<S-Tab>", ":bprev<cr>")

-- Personally I think tabs are better than spaces, but everyone else
-- seems to disagree, so here we go.
-- NOTE TO SELF: At work we use 2 spaces, so make this configurable.
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- enable line numbers.
vim.opt.number = true
vim.opt.relativenumber = true

-- set search to be case insensitive, unless upper cases are explicitly searched for
vim.opt.ignorecase = true
vim.opt.smartcase = true
