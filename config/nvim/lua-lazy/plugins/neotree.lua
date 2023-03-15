return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  keys = {
    { "<C-n>", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
  },
  init = function ()
    vim.g.neo_tree_remove_legacy_commands = 1
  end,
  opts = {
      close_if_last_window = true,
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons",
    "munifTanjim/nui.nvim",
  },
}
