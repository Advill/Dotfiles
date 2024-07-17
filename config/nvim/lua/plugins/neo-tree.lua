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
          always_show = {
            ".gitlab-ci.yml",
            ".gitlab-ci.yaml",
            ".gitlab",
            ".gitlab/*",
          },
          never_show = {
            ".git",
            ".git/*",
          },
        },
        group_empty_dirs = true,
      },
      --[[
      event_handlers = {
        {
          event = "neo_tree_popup_input_ready",
          handler = function()
            vim.cmd("stopinsert")
          end,
        },
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            vim.cmd("highlight! Cursor blend=100")
          end,
        },
        {
          event = "neo_tree_buffer_leave",
          handler = function()
            vim.cmd("highlight! Cursor guibg=#5f87af blend=0")
          end,
        },
      },
      --]]
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
