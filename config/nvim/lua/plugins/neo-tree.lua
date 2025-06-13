return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      auto_clean_after_session_restore = true,
      hide_root_node = true,
      filesystem = {
        filtered_items = {
          visible = true,
          force_visible_in_empty_folder = true,
          follow_current_file = { enabled = false },
          hide_dotfiles = false,
          never_show = {
            ".git",
            ".git/*",
            "node_modules",
            ".DS_Store",
            "thumbs.db",
          },
          never_show_by_pattern = {
            "*/src/*/tsconfig.json",
            ".null-ls_*",
          },
        },
        group_empty_dirs = true,
      },
      window = {
        mappings = {
          ["P"] = { "toggle_preview", config = { use_float = true } },
        },
      },
    },
    keys = {
      {
        "<leader>fE",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
        end,
        desc = "Explorer NeoTree (Root Dir)",
      },
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
      {
        "<leader>fx",
        function()
          require("neo-tree.command").execute({ action = "focus" })
        end,
        desc = "Focus NeoTree",
      },
      { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (Root Dir)", remap = true },
      { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (cwd)", remap = true },
      { "<leader>t", "<leader>fx", desc = "Focus NeoTree", remap = true },
    },
  },
}
