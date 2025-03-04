vim.keymap.set('n', '<C-q>', '<Cmd>Neotree toggle<CR>', {silent = true})
vim.keymap.set('n', '<C-Right>', '<Cmd>tabnext<CR>', {silent = true})
vim.keymap.set('n', '<C-Left>', '<Cmd>tabprevious<CR>', {silent = true})
vim.keymap.set('n', '<C-p>', '<cmd>FzfLua files<cr>', {silent = true})
vim.keymap.set('n', '<C-b>', '<cmd>FzfLua buffers<cr>', {silent = true})
vim.keymap.set('n', '<C-f>', '<cmd>FzfLua live_grep_native	<cr>', {silent = true})
vim.keymap.set('n', '<C-S-t>', '<cmd>tabnew<cr>', {silent = true})
vim.keymap.set('n', '<C-M-lt>', '<cmd>RustFmt<cr>', {silent = true})
vim.keymap.set('n', '<C-M-«>', '<cmd>RustFmt<cr>', {silent = true})
vim.keymap.set('n', '<BS>', '<C-^>', {silent = true})

vim.keymap.set('n', '<up>', '<nop>', {silent = true})
vim.keymap.set('n', '<down>', '<nop>', {silent = true})
vim.keymap.set('n', '<right>', '<nop>', {silent = true})
vim.keymap.set('n', '<left>', '<nop>', {silent = true})

vim.keymap.set('n', '<MiddleMouse>', '<nop>', {silent = true})
vim.keymap.set('i', '<MiddleMouse>', '<nop>', {silent = true})

vim.keymap.set('n', '<C-Left>', '<cmd>tabprevious<cr>', {silent = true})
vim.keymap.set('n', '<C-Right>', '<cmd>tabnext<cr>', {silent = true})

vim.keymap.set('n', '<C-h>', '<C-w>h', {silent = true})
vim.keymap.set('n', '<C-j>', '<C-w>j', {silent = true})
vim.keymap.set('n', '<C-k>', '<C-w>k', {silent = true})
vim.keymap.set('n', '<C-l>', '<C-w>l', {silent = true})

vim.keymap.set('i', '<D-`>', '`', {silent = true})
