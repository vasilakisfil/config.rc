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

