return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      close_if_last_window = false,
      default_component_configs = {
        diagnostics = {
          symbols = {
            hint = "",
            info = "",
            warn = "",
            error = "X",
          },
        },
      }
    }
  },
}
