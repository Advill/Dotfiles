return {
  {
    'williamboman/mason.nvim',
    lazy = false,
    dependencies = {
      {
        'jayp0521/mason-null-ls.nvim',
        'williamboman/mason-lspconfig.nvim',
        opts = {
          automatic_installation = true,
          auto_update = true,
        },
      }
    }
  }
}
