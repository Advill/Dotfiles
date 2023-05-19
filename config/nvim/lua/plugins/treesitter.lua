return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    config = function() 
      require('nvim-treesitter').setup({
        auto_install = true,
        ensure_installed = 'all',
        highlight = { 
          enable = true,
        },
        indent = {
          enable = true,
        },
        rainbow = {
          query = {
            "rainbow-parens",
            html = "rainbow-tags",
            javascript = "rainbow-tags-react",
            tsx = "rainbow-tags",
          },
        },
        autotag = {
          enable = true,
        },
      })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-context',
      'HiPhish/nvim-ts-rainbow2',
      'windwp/nvim-ts-autotag',
    }
  }
}
