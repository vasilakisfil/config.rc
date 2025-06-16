require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "rust_analyzer" },
}
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("lspconfig").rust_analyzer.setup({
  capabilities = capabilities,
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = true
      },
      check = { command = "check", extraArgs = {}, features = "all" }
    }
  }
})

vim.api.nvim_create_autocmd({ "CursorHold" }, {
    pattern = "*",
    callback = function()
        for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
            if vim.api.nvim_win_get_config(winid).zindex then
                return
            end
        end
        vim.diagnostic.open_float({
            scope = "line",
            focusable = false,
            close_events = {
                "CursorMoved",
                "CursorMovedI",
                "BufHidden",
                "InsertCharPre",
                "WinLeave",
            },
            severity = {min = vim.diagnostic.severity.ERROR}
        })
    end
})

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = {severity = {min = vim.diagnostic.severity.ERROR}},
  signs = {severity = {min = vim.diagnostic.severity.ERROR}},
  underline = {severity = {min = vim.diagnostic.severity.ERROR}},
})

for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
 vim.api.nvim_set_hl(0, group, {})
end
