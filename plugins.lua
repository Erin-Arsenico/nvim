vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'Tetralux/odin.vim'
  use 'folke/tokyonight.nvim'
  use 'neovim/nvim-lspconfig'
  use 'wbthomason/packer.nvim'
  use 'B4mbus/oxocarbon-lua.nvim'
  
  -- CMP & LSP
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'L3MON4D3/LuaSnip'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'

  use ( 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use { 'nvim-telescope/telescope.nvim', requires = {{ 'nvim-lua/plenary.nvim' }}}
  use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true }}
end)
