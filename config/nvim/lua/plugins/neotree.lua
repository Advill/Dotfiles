return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    branch = "v2.x",
    keys = {
      { "<C-n>", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
    },
    config = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      require("neo-tree").setup {
        close_if_last_window = true,
        sort_case_insensitive = true,
        enable_git_status = true,
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_hidden = false,
            hide_by_name = {
              "node_modules"
            },
          },
          follow_current_file = true,
          group_empty_dirs = true,
          hijack_netrw_behavior = "open_default",
        },
        buffers = {
          follow_current_file = true,
          group_empty_dirs = true,
        },
        mappings = {
          ["<2-LeftMouse>"] = "open",
          ["<cr>"] = "open",
          ["P"] = { "toggle_preview", config = { use_float = true } },
          ["S"] = "split_with_window_picker",
          ["s"] = "vsplit_with_window_picker",
          ["a"] = { 
            "add",
            -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
            -- some commands may take optional config options, see `:h neo-tree-mappings` for details
            config = {
              show_path = "relative"
            }
          },
          ["c"] = { 
            "copy",
            -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
            -- some commands may take optional config options, see `:h neo-tree-mappings` for details
            config = {
              show_path = "relative"
            }
          },
        }
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "munifTanjim/nui.nvim",
      {
        's1n7ax/nvim-window-picker',
        config = function()
          require'window-picker'.setup({
            autoselect_one = true,
            include_current = false,
            filter_rules = {
              bo = {
                -- if the file type is one of following, the window will be ignored
                filetype = { 'neo-tree', "neo-tree-popup", "notify" },

                -- if the buffer type is one of following, the window will be ignored
                buftype = { 'terminal', "quickfix" },
              },
            },
          })
        end,
      }
    },
  }
}
