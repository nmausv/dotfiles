-- Treesitter Plugin Setup
require('nvim-treesitter.configs').setup {
  ensure_installed = {
      -- "vimdoc",
      "lua",
      "rust",
      "toml",
      "ocaml",
      "python",
      "c",
      "markdown", "markdown_inline" },
  auto_install = true,
  highlight = {
    enable = true,
    disable = {'latex'},
    additional_vim_regex_highlighting = true,
  },
  ident = { enable = true },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
}

-- Treesitter folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
