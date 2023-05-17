return {
  {
    "numToStr/FTerm.nvim",
    config = function()
      require'FTerm'.setup({
        blend = 15
      })
      vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
      vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
    end,
  }
}
