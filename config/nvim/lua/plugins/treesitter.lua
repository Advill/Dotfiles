return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    main = 'nvim-treesitter.configs',
    opts = {
      auto_install = true,
      ensure_installed = {'lua', 'vim', 'c_sharp', 'typescript', },
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
    },
    dependencies = {
      'nvim-treesitter/nvim-treesitter-context',
      'HiPhish/nvim-ts-rainbow2',
      'windwp/nvim-ts-autotag',
    }
  },
}
