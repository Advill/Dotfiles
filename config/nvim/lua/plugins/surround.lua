if true then
  return {}
end
return {
  "echasnovski/mini.surround",
  opts = {
    mappings = {
      add = "ys",
      delete = "ds",
      find = "",
      find_left = "",
      highlight = "",
      replace = "cs",
      update_n_lines = "",

      -- Add this only if you don't want to use extended mappings
      suffix_last = "",
      suffix_next = "",
    },
    search_method = "cover_or_next",
  },
  keys = {
    --{ "ys", mode = { "x" }, false },
    --{ "S", mode = { "x" }, "<cmd> lua MiniSurround.add('visual')<CR>", { silent = true } },
  },
}
