-- settings configuration
--impatient
require('impatient')

local set = vim.opt

-- Floaterm
vim.g.floaterm_winblend = 1

-- Notifications
vim.notify = require('notify')

-- Indentation 
set.expandtab = true
set.autoindent = true
set.smarttab = true
set.shiftwidth = 2
set.softtabstop = 2
set.tabstop = 2

-- Search options
set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

-- Better splits
set.splitbelow = true
set.splitright = true
set.wrap = false
set.scrolloff = 5

-- File enccoding
set.fileencoding = 'utf-8'

set.termguicolors = true

-- Display relative line numbers and highlight current line/column
set.cursorline = true
set.number = true
set.relativenumber = true

-- hidden files shown by default
set.hidden = true
set.completeopt = 'menuone,noselect'

-- Folding settings
set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"
set.foldenable = false

-- Folding commands:
-- zo -> open fold
-- zc -> close fold
-- zO -> open fold recursively
-- zC -> close fold recursively

--characters and Indentation
set.list = true
--set.listchars:append "space:⋅"
set.listchars:append "trail:~"
set.listchars:append "tab:»·"
set.listchars:append "eol:↴"

-- colorscheme
vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_disable_background = true
vim.g.nord_enable_sidebar_background = true
vim.g.nord_italic = true
vim.g.nord_uniform_diff_background = true
vim.g.nord_bold = true
vim.cmd('colorscheme nord')
