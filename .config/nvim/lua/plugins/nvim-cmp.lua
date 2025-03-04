return {
  "hrsh7th/nvim-cmp",
  -- optional for icon support
  dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
  },
  lazy = true,
  event = { "InsertEnter", "CmdlineEnter" },
  opts = {},
}
