require('haskell-ftplugin-shared')

-- Disable inlay hints for cabal files. This causes neovim lsp to bug out
vim.lsp.inlay_hint.enable(false)
