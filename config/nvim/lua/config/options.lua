vim.opt.mouse = "a"
vim.opt.scrolloff = 15
vim.opt.cursorline = true
-- vim.opt.spelling = 'en'
vim.opt.ttyfast = true
-- allow buffer switching without saving
vim.opt.hidden = true
vim.opt.swapfile = false

-- Appearance
vim.opt.scrolloff = 15
vim.opt.splitright = true
vim.opt.cmdheight = 0

-- vim.opt.wrapmargin = 120
vim.opt.colorcolumn = "81,121"
vim.opt.showmode = false

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.inccommand = "split"
vim.opt.showmatch = true

-- Performance
vim.opt.hidden = true

-- colors
vim.opt.termguicolors = true

-- Splits
vim.o.splitbelow = true
vim.o.splitright = false

-- Tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.eol = true

-- Indent
vim.opt.smartindent = true

-- disable netrw
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
