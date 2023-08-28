return {
  {
    "folke/trouble.nvim",
    dependencies = {"kyazdani42/nvim-web-devicons"},
    config = function ()
      require('trouble').setup {
        height = 10,
        mode = 'document_diagnostics',
        padding = false,
        auto_close = true,

      }
      vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
      {silent = true, noremap = true});
    end,
  }
}
