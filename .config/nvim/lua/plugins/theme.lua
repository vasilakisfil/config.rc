return {
  "AstroNvim/astrotheme",
  lazy = false,
  priority = 1000,
  opts = {
    palette = "astrodark"
  },
  config = function(_, opts)
    require('astrotheme').setup(opts)
  end,
}
