require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

local language_servers = {
  'sumneko_lua',
  'clangd',
  'bashls',
  'pyright',
  'marksman',
  'yamlls',
  'jsonls',
  'cmake',
  'lemminx',
  'svls',
}

require("mason-lspconfig").setup({
  ensure_installed = language_servers,
  automatic_installation = true,
})

-----------------------------------nvim-cmp--------------------------------------
local cmp = require('cmp')
-----------------------------------lspkind--------------------------------------
local lspkind = require('lspkind')
-----------------------------------null-ls--------------------------------------
local null_ls = require('null-ls')
local null_ls_sources = {
  -- null_ls.builtins.diagnostics.markdownlint,
  -- null_ls.builtins.formatting.markdownlint,
  -- null_ls.builtins.formatting.stylua,
  -- null_ls.builtins.formatting.clang_format,
  -- null_ls.builtins.diagnostics.cmake_lint,
  -- null_ls.builtins.formatting.cmake_format
  null_ls.builtins.code_actions.gitsigns
}
require('mason-null-ls').setup({
  ensure_installed = {"clang-format", "stylua", "cmake_lint", "cmake_format", "markdownlint"},
  automatic_installation = true,
  automatic_setup = true,
})

null_ls.setup{
  sources = null_ls_sources,
}
require 'mason-null-ls'.setup_handlers()

----------------------------------autopairs-------------------------------------
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      with_text = true,
      maxwidth = 50, -- prevent the popup from showing more than 50 characters
    })
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    -- ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    --use tabs to move btw suggestions
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'ultisnips' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  })
})

-- Only autocomplete search with elements in the current buffer
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Only autocomplete ':' with commands and paths
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

----------------------------nvim-lspconfig--------------------------------------

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>D', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  local builtin = require('telescope.builtin')
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gd', builtin.lsp_definitions, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  -- vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gI', builtin.lsp_implementations, bufopts)
  -- vim.keymap.set('n', '<leader>sh', vim.lsp.buf.signature_help, bufopts) -- NOTE: commented out since I don't really use markers
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', 'gs', builtin.lsp_type_definitions, bufopts)
  vim.keymap.set('n', 'gs', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', 'gR', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, bufopts)
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'gr', builtin.lsp_references, bufopts)
  vim.keymap.set('n', '<leader>cf', function()
    vim.lsp.buf.format { async = true }
  end, bufopts)
  vim.keymap.set('v', '<leader>cf', function()
    vim.lsp.buf.format { async = true }
  end, bufopts)

  --LSP signature config
  require("lsp_signature").on_attach({
    bind = true, --This is mandatory, otherwise border config wont get registered.
    hint_prefix = "  ",
    -- transparency = 30,
  }, bufnr)
end

local lsp_flags = {
  debunce_text_changes = 150
}

for _, lsp in pairs(language_servers) do
  require('lspconfig')[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server specific settings
    --settings = {
    --  ["rust_analyzer"] = {}
    --}
  }
end
