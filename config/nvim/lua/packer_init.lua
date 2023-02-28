local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Language servers
  use {
    'williamboman/mason.nvim',
    config = require('mason').setup ()
  }

  use {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require("mason-lspconfig").setup {
        automatic_installation = true,
        auto_update = true,
      }
    end
  }
  use 'neovim/nvim-lspconfig'
  use {
    "jose-elias-alvarez/null-ls.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    }
  }
  use "jayp0521/mason-null-ls.nvim"

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'nvim-telescope/telescope-ui-select.nvim'

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        signcolumn = false,  -- Toggle with `:Gitsigns toggle_signs`
        numhl = true,
        current_line_blame = true,
      }
    end
  }
  use 'tpope/vim-fugitive'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    config = function()
      require('nvim-treesitter.configs').setup {
        auto_install = true,
        highlight = { enable = true }
      }
    end
  }
  use 'nvim-treesitter/nvim-treesitter-context'
  use {
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      vim.g.indent_blankline_char = '│'
      vim.g.indent_blankline_use_treesitter = true
      vim.g.indent_blankline_use_treesitter_scope = true
      vim.g.indent_blankline_show_trailing_blankline_indent = false
      require'indent_blankline'.setup {
        show_current_context = true,
        show_current_context_start = true,
      }
    end
  }

  -- Trouble
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function ()
      vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
        {silent = true, noremap = true})
    end
  }

  -- Autocompletion
  use 'rafamadriz/friendly-snippets'
  use {
    'L3MON4D3/LuaSnip',
    config = function ()
      require('luasnip.loaders.from_vscode').lazy_load()
    end
  }

  use {
    "windwp/nvim-autopairs",
    config = function ()
      require("nvim-autopairs").setup {
        enable_check_bracket_line = true
      }
    end
  }

  use {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    end
  }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use 'onsails/lspkind.nvim'

  -- Neo Tree
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      require("neo-tree").setup {
        close_if_last_window = true,
        
      }
      _G.map('n', '<C-n>', ':Neotree toggle <CR>')
    end
  }

  -- doc view
  use {
    "amrbashir/nvim-docs-view",
    opt = true,
    cmd = { "DocsViewToggle" },
    config = function()
      require("docs-view").setup {
        position = "right",
        width = 60,
      }
    end
  }

  -- Terminal
  use {
    "numToStr/FTerm.nvim",
    config = function()
      require'FTerm'.setup({
        blend = 15
      })
      vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
      vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
    end,
  }

  -- Theming
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'gruvbox',
          component_separators = { left = '|', right = '|' },
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {'location'}
        },
        tabline= {
          lualine_a = {'buffers'},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {'tabs'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
        extensions = {'nvim-tree'},
      }
    end
  }
  use {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require("gruvbox").setup {
        contrast = "hard", -- can be "hard", "soft" or empty string
        dim_inactive = false,
        transparent_mode = true,
        invert_selection = true,
        overrides = {
          -- GruvboxBg0 = {bg = nil, fg = nil},
          -- Normal = {bg = nil, fg = nil}
          -- ColorColumn = {bg = '#458588'}
        }
      }
      vim.cmd("colorscheme gruvbox")
    end
  }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
