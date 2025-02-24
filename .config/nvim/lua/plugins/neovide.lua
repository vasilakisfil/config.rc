if not vim.g.neovide then
  return {} -- do nothing if not in a Neovide session
end

return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    options = {
      g = {
        neovide_scale_factor = 0.9,
        neovide_fullscreen = true,
        neovide_confirm_quit = true
      },
    },
  },
}
