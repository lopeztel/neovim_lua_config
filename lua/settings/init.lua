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

--Diagnostics
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
vim.diagnostic.config({
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
  virtual_text = {
    source = "always",  -- Or "if_many"
  },
  float = {
    source = "always",  -- Or "if_many"
  },
})
