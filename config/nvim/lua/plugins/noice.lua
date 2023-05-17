return {
  {
    'folke/noice.nvim',
    config = function()
      local telescope = require('telescope')
      telescope.setup {}
      telescope.load_extension('ui-select')
      telescope.load_extension('noice')
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = true,
        },
      })
    end,
    dependencies = {
      "munifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        opts = {
          background_colour = "#000000"
        }
      },
    }
  }
}
