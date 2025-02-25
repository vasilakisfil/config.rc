-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
vim.filetype.add {
  extension = {
    foo = "fooscript",
  },
  filename = {
    ["Foofile"] = "fooscript",
  },
  pattern = {
    ["~/%.config/foo/.*"] = "fooscript",
  },
}

vim.lsp.log.set_level(vim.log.levels.OFF)

vim.keymap.set('n', '<C-q>', '<Cmd>Neotree toggle<CR>', {silent = true})
vim.keymap.set('n', '<C-Right>', '<Cmd>tabnext<CR>', {silent = true})
vim.keymap.set('n', '<C-Left>', '<Cmd>tabprevious<CR>', {silent = true})
vim.keymap.set('n', '<C-p>', '<cmd>FzfLua files<cr>', {silent = true})
vim.keymap.set('n', '<C-b>', '<cmd>FzfLua buffers<cr>', {silent = true})
vim.keymap.set('n', '<C-f>', '<cmd>FzfLua live_grep<cr>', {silent = true})
vim.keymap.set('n', '<C-S-t>', '<cmd>tabnew<cr>', {silent = true})
vim.keymap.set('n', '<C-M-lt>', '<cmd>RustFmt<cr>', {silent = true})
vim.keymap.set('n', '<C-M-«>', '<cmd>RustFmt<cr>', {silent = true})
vim.keymap.set('n', '<BS>', '<C-^>', {silent = true})

vim.g.neovide_position_animation_length = 0
vim.g.neovide_cursor_animation_length = 0.00
vim.g.neovide_cursor_trail_size = 0
vim.g.neovide_cursor_animate_in_insert_mode = false
vim.g.neovide_cursor_animate_command_line = false
vim.g.neovide_scroll_animation_far_lines = 0
vim.g.neovide_scroll_animation_length = 0.00

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
