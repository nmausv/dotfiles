-- Use Skim as the VimTeX PDF viewer
vim.g.vimtex_view_method = 'skim'
vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_quickfix_ignore_filters = {
	'Underfull',
	'Overfull'
}

vim.cmd("autocmd Filetype tex setl updatetime=1")
