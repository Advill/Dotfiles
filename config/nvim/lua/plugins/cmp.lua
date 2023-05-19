return {
  {
    'hrsh7th/nvim-cmp',
    event = {
      "insertEnter",
      "CmdlineEnter",
    },
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
    }
  },
}
