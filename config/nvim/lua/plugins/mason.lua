return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    priority = 55,
    opts = {
      ui = {
        border = 'rounded', -- or 'shadow'
      },
    },
    dependencies = {
      {
      },
      'jayp0521/mason-null-ls.nvim',
    }
  },
  {
    'williamboman/mason-lspconfig.nvim',
    lazy = false,
    priority = 54,
    config = function()
      local masonlsp = require('mason-lspconfig')
      masonlsp.setup({
        automatic_installation = true,
        auto_update = true,
      })
      masonlsp.setup_handlers({
        function (server_name) -- default handler
          require('lspconfig')[server_name].setup{}
        end,
      })
    end,
  }
}
