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
        hide_root_nofalsede = true,
        window = {
          position = "left",
          width = "20%",
          max_width = 40,
          mappings = {
            -- disable this mapping to allow default `l` to work
            ["l"] = "noop"
          }
        },
        default_component_configs = {
          container = {
            -- do not fade characters that don't fit in neo-tree window
            enable_character_fade = false,
          },
          indent = {
            indent_size = 1
          }
        },
        -- disable default renderers to allow horizontal scroll
        renderers = {
          directory = {
            { "indent" },
            { "icon" },
            { "current_filter" },
            { "name" },
            { "clipboard" },
            { "diagnostics", errors_only = true },
          },
          file = {
            { "indent" },
            { "icon" },
            {
              "name",
              use_git_status_colors = true,
              zindex = 10
            },
            { "clipboard" },
            { "bufnr" },
            { "modified" },
            { "diagnostics" },
            { "git_status" },
          },
        },
        close_if_last_window = false,
      })
    end
  }
}
