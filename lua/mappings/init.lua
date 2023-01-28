local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Leader key is SPACE
vim.g.mapleader = ' '

------------------------Toggle File Explorer---------------------
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

------------------------Splits-----------------------------------
map('n', '<S-Right>', ':vsplit<CR>', opts)
map('n', '<S-Down>', ':split<CR>', opts)

-----------------------Window Movement---------------------------
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

----------------------Tab Movement-------------------------------
map('n', '<C-t>', ':tabnew<CR>', opts)
map('n', '<C-Left>', ':tabpre<CR>', opts)
map('n', '<C-Right>', ':tabnext<CR>', opts)

----------------------Buffer Movement----------------------------
map('n', 'gb', ':bnext<CR>', opts)
map('n', 'gB', ':bprevious<CR>', opts)
map('n', 'bd', ':bdelete<CR>', opts)

----------------------Barbar keymaps----------------------------
-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<leader>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<leader>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<leader>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<leader>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

----------------------Telescope keymaps----------------------------
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>ft', builtin.treesitter, {})
vim.keymap.set('n', '<leader>td', '<Cmd>TodoTelescope<CR>', {})
vim.keymap.set('n', '<leader>fS', builtin.lsp_workspace_symbols, {})
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fc', builtin.colorscheme, {})
vim.keymap.set('n', '<leader>fq', builtin.quickfix, {})
vim.keymap.set('n', '<leader>s', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    -- winblend = 10,
    previewer = false,
})
end, { desc = '[/] Fuzzyly search in current buffer]'})

----------------------Floating term keymaps--------------------------
vim.g.floaterm_keymap_new = '<leader>tn'
vim.g.floaterm_keymap_prev = '<Leader>th'
vim.g.floaterm_keymap_next = '<Leader>tl'
vim.g.floaterm_keymap_toggle = '<Leader>tt'

----------------------Markdown preview keymaps-----------------------
vim.keymap.set('n', '<leader>m', '<Cmd>MarkdownPreviewToggle<CR>', {})
