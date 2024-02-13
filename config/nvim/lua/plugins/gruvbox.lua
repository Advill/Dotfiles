return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function ()
      require('gruvbox').setup({
        contrast = "hard", -- can be "hard", "soft" or empty string
        dim_inactive = false,
        transparent_mode = true,
        invert_selection = true,
        italic = {
          strings = false,
          comments = false,
          operators = false,
          folds = false,
        },
        overrides = {
          -- GruvboxBg0 = {bg = nil, fg = nil},
          -- Normal = {bg = nil, fg = nil}
          -- ColorColumn = {bg = '#458588'}
        }
      });
      vim.cmd("colorscheme gruvbox")
    end 
  }
}
