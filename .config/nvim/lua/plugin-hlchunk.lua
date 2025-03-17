require("hlchunk").setup({
  chunk = {
    enable = true,
    chars = {
        horizontal_line = "─",
        vertical_line = "│",
        left_top = "┌",
        left_bottom = "└",
        right_arrow = "─",
    },
    use_treesitter = false,
    style = "#b16286",
  },
  indent = {
    enable = true,
    style = {
         "#504945",
         "#3c3836",
    },
  }
})

