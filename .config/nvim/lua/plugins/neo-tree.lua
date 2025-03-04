return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      require('neo-tree').setup({
        window = {
          position = "left",
          width = 20,
        },
        close_if_last_window = false,
        --default_component_configs = {
        --  diagnostics = {
        --    symbols = {
        --      hint = "",
        --      info = "",
        --      warn = "",
        --      error = "X",
        --    },
        --  },
        --}
      })
    end
  }
}
