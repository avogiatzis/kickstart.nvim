-- Map <leader>e to toggle Neo-tree
vim.api.nvim_set_keymap('n', '<leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>dI', vim.diagnostic.open_float, { desc = 'Open diagnostic float' })
vim.keymap.set('n', 'ge', function()
  vim.diagnostic.jump { count = 1 }
end, { desc = 'Go to next diagnostic' })
vim.keymap.set('n', 'gE', function()
  vim.diagnostic.jump { count = -1 }
end, { desc = 'Go to previous diagnostic' })
