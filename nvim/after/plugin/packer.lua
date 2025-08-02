-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- plenary
  use 'nvim-lua/plenary.nvim'
  -- devicons
  use 'nvim-tree/nvim-web-devicons'
  -- LaTeX support
  use 'lervag/vimtex'
  -- Git integration
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'
  -- Delimiter editing
  use 'tpope/vim-surround'
  -- Catpuccinn
  use { "catppuccin/nvim", as = "catppuccin" }
  -- Status Line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  -- LSP Plugins
  use 'neovim/nvim-lspconfig'
  -- Rust Plugin
  use 'simrat39/rust-tools.nvim'
  -- Lua Plugin
  use 'folke/neodev.nvim'
  -- Go Plugin
  use 'ray-x/go.nvim'
  -- Lean Plugin
  use 'Julian/lean.nvim'
  -- nvim CMP plugins
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'quangnguyen30192/cmp-nvim-ultisnips'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-calc'
  -- Treesitter
  use 'nvim-treesitter/nvim-treesitter'
  -- debugging
  use 'mfussenegger/nvim-dap'
  use { "rcarriga/nvim-dap-ui",
    requires = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio"
    }
  }
  use 'theHamsta/nvim-dap-virtual-text'
  -- Hop
  use 'phaazon/hop.nvim'
  -- Snippets
  use 'SirVer/ultisnips'
  -- barbar
  use 'romgrk/barbar.nvim'
  -- Obsidian integration
  use({
    'epwalsh/obsidian.nvim',
    tag = '*', -- recommended, use latest release instead of latest commit
    requires = {
      -- Required.
      'nvim-lua/plenary.nvim',
      -- Optional
      'preservim/vim-markdown'
    }
  })
  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  -- Undo Tree
  use 'mbbill/undotree'
  -- tmux integration
  use({
    "aserowy/tmux.nvim",
    config = function() return require("tmux").setup() end
  })
end)
