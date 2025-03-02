require("config.lazy")
vim.cmd.colorscheme('solarized')
require("config.mappings")
require("config.options")
require("init.lsp")
require("init.cmp")

vim.o.sessionoptions="blank,buffers,curdir,folds,globals,help,tabpages,winsize,winpos,terminal,localoptions"
