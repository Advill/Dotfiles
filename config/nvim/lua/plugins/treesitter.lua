return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = function ()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
    opts = {
      auto_install = true,
      highlight = { enable = true },
    }
  },
  'nvim-treesitter/nvim-treesitter-context',
}
