vim.opt.confirm = false
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.foldcolumn = "1"
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.ignorecase = true
vim.opt.infercase = true
vim.opt.jumpoptions = {}
vim.opt.laststatus = 2
vim.opt.linebreak = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.pumheight = 10
vim.opt.relativenumber = false
vim.opt.shiftround = true
vim.opt.shiftwidth = 0
vim.opt.shortmess = vim.tbl_deep_extend("force", vim.opt.shortmess:get(), { s = true, I = true })
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeoutlen = 500
vim.opt.title = true
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.viewoptions = vim.tbl_filter(function(val) return val ~= "curdir" end, vim.opt.viewoptions:get())
vim.opt.virtualedit = "block"
vim.opt.wrap = false
vim.opt.writebackup = false
vim.opt.autoread = true
vim.opt.conceallevel = 2
vim.opt.breakindent = true
vim.opt.copyindent = true
vim.opt.preserveindent = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.shiftwidth=2
vim.opt.softtabstop=2
vim.opt.tabstop=2
vim.opt.expandtab = true
vim.opt.incsearch = false

vim.g.background = 'dark'
vim.g.markdown_recommended_style = 0
vim.g.rust_recommended_style = false

if vim.g.neovide then
  vim.o.guifont = "UbuntuMono Nerd Font Mono:h15"
  vim.g.neovide_position_animation_length = 0
  vim.g.neovide_cursor_animation_length = 0.00
  vim.g.neovide_cursor_trail_size = 0
  vim.g.neovide_cursor_animate_in_insert_mode = false
  vim.g.neovide_cursor_animate_command_line = false
  vim.g.neovide_scroll_animation_far_lines = 0
  vim.g.neovide_scroll_animation_length = 0.00
  vim.g.neovide_fullscreen = true
end
