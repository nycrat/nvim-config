vim.pack.add { { src = "https://github.com/rose-pine/neovim", name = "rose-pine" } }

require "rose-pine".setup {
  palette = {
    dawn = {
      _nc = "#f8f0e7",
      base = "#eaeaea",
      surface = "#fafafa",
      overlay = "#fffaf3",
      muted = "#eea4b2",
      subtle = "#db7bae",
      text = "#871474",
      love = "#b4637a",
      gold = "#d93dc1",
      rose = "#59dbf2",
      pine = "#286983",
      foam = "#d18a8d",
      iris = "#907aa9",
      leaf = "#6d8f89",

      pink = "#d9b2c1",
      blue = "#9cd8f4",

      highlight_low = "#f4ede8",
      highlight_med = "#dfdad9",
      highlight_high = "#cecacd",
      none = "NONE",
    }
  },
  highlight_groups = {
    Comment = { fg = "pink" }
  },
  styles = {
    transparency = true
  }
}

vim.cmd "colorscheme rose-pine-dawn"
