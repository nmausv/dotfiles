local hop = require'hop'.setup()

vim.api.nvim_set_keymap("n", "<Leader>hw", ":HopWord <CR>", {silent = true} )
