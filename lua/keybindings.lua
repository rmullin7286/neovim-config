-- These are bindings for neotest. <leader>tt will run the target closest to
-- the cursor, and <leader>ft will run all targets in the file.
vim.keymap.set('n', '<leader>tt', function() require('neotest').run.run() end)
vim.keymap.set('n', '<leader>tf', function() require('neotest').run.run(vim.fn.expand('%')) end)

-- These bindings cycle through buffers, which will be displayed as
-- tabs at the top of the editor.
vim.keymap.set("n", "<Tab>", ":bnext<cr>")
vim.keymap.set("n", "<S-Tab>", ":bprev<cr>")


-- Debugging keybindings
vim.keymap.set('n', '<leader>db', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F6>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F7>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F8>', function() require('dap').step_out() end)
vim.keymap.set('n', '<leader>dh', function() require('dap.ui.widgets').hover() end)
