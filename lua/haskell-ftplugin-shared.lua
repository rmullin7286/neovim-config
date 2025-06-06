-- This will be loaded when either a cabal or a haskell file is entered
local ht = require("haskell-tools")
local bufnr = vim.api.nvim_get_current_buf()
local opts = { noremap = true, silent = true, buffer = bufnr }

-- to be honest I still don't know what a code lens is
vim.keymap.set('n', '<leader>cl', vim.lsp.codelens.run, opts)

-- Hoogle is the search engine for haskell apis.
vim.keymap.set('n', '<leader>hs', ht.hoogle.hoogle_signature, opts)

-- evaluates all code snippets
vim.keymap.set('n', '<leader>ca', ht.lsp.buf_eval_all, opts)

-- Toggles the GHCi repl for the current package
vim.keymap.set('n', '<leader>rr', ht.repl.toggle, opts)

-- Toggle GHCi for the current buffer
vim.keymap.set('n', '<leader>rf', function()
    ht.repl.toggle(vim.api.nvim_buf_get_name(0))
end, opts)

-- Quits the repl
vim.keymap.set('n', '<leader>rq', ht.repl.quit, opts)

-- things bug out when inlay hints are enabled
vim.lsp.inlay_hint.enable(false)
