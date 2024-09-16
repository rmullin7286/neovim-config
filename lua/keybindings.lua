local neotest = require('neotest')

-- These are bindings for neotest. <leader>tt will run the target closest to
-- the cursor, and <leader>ft will run all targets in the file.
vim.keymap.set('n', '<leader>tt', neotest.run.run)
vim.keymap.set('n', '<leader>tf', function()
    neotest.run.run(vim.fn.expand("%"))
end)

-- These bindings cycle through buffers, which will be displayed as
-- tabs at the top of the editor.
vim.keymap.set("n", "<Tab>", ":bnext<cr>")
vim.keymap.set("n", "<S-Tab>", ":bprev<cr>")
