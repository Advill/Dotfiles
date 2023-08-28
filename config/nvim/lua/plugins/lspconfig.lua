return {
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    priority = 53,
    dependencies = {
      {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
          "SmiteshP/nvim-navic",
          "munifTanjim/nui.nvim"
        },
        opts = {
          lsp = { auto_attach = true },
          window = {
            size = '80%',
            scrolloff = 3,
          },
          source_buffer = {
            highlight = false,
            scrolloff = 15,
          }
        }
      }
    },
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    }
  },
}
