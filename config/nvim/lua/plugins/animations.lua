return {
  {
    "folke/snacks.nvim",
    opts = {
      scroll = {
        animate = {
          duration = { step = 15, total = 250 },
          easing = "outInQuad",
        },
        animate_repeat = {
          duration = { step = 5, total = 100 },
          easing = "inOutQuad",
        },
      },
    },
  },
}
