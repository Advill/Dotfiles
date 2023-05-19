return {
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    priority = 53,
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    }
  },
}
