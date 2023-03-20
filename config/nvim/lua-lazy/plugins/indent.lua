return {
  {
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
    end,
  },
}
