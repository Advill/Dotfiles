return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  keys = {
    { "<C-n>", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
  },
  config = function()
    vim.g.neo_tree_remove_legacy_commands = 1
    require("neo-tree").setup {
      close_if_last_window = true,
    }
    _G.map('n', '<C-n>', ':Neotree toggle <CR>')
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons",
    "munifTanjim/nui.nvim",
  },
}
