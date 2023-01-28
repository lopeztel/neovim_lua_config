local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Optimization plugin
  use 'lewis6991/impatient.nvim'
  -- File Explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }
  -- Neovim notifications
  use 'rcarriga/nvim-notify'
  -- Pretty bottom bar
  use {
    'nvim-lualine/lualine.nvim',
    wants = 'nvim-web-devicons'
  }
  -- Pretty tabs
  use {
    'romgrk/barbar.nvim',
    wants = 'nvim-web-devicons'
  }
  -- Tree sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
  }
  use { -- better refactoring, higlighting and navigation
    'nvim-treesitter/nvim-treesitter-refactor',
    requires = {
      'nvim-treesitter/nvim-treesitter',
    },
  }
  use { -- autotag html/xml files
    'windwp/nvim-ts-autotag',
    requires = {
      'nvim-treesitter/nvim-treesitter',
    },
  }
  use {
    'windwp/nvim-autopairs', --autopairs
    config = function () require("nvim-autopairs").setup {} end
  }

  use { -- freeze context function/loop at the top
    'nvim-treesitter/nvim-treesitter-context',
    requires = {
      'nvim-treesitter/nvim-treesitter',
    },
  }
  -- colorschemes
  use 'shaunsingh/nord.nvim'
  use 'EdenEast/nightfox.nvim'
  use { -- nord theme highlighting for treesittern LSP and Telescope
    'andersevenrud/nordic.nvim',
    requires = {
      'nvim-treesitter/nvim-treesitter',
    },
  }
  use 'folke/tokyonight.nvim'
  use 'rose-pine/neovim'
  use 'catppuccin/nvim'
  use 'ellisonleao/gruvbox.nvim'
  -- LSP stuffs
  use {
    'williamboman/mason.nvim',
    requires = {
      'williamboman/mason-lspconfig.nvim', --gap closing between mason and lspconfig 
      'neovim/nvim-lspconfig', --configs for the Nvim LSP client 
      'jose-elias-alvarez/null-ls.nvim', --Linter & Formatter
      "jay-babu/mason-null-ls.nvim", --bindings between null-ls and mason
    },
  }
  --Floating terminal
  use 'voldikss/vim-floaterm'
  use 'akinsho/toggleterm.nvim'
  -- Autocompletion stuff
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'SirVer/ultisnips'
  use 'quangnguyen30192/cmp-nvim-ultisnips'
  use 'onsails/lspkind.nvim'
  use 'ray-x/lsp_signature.nvim'
  -- Telescope
use {
  'nvim-telescope/telescope.nvim',
  requires = {
      {'nvim-lua/plenary.nvim'},
      {'BurntSushi/ripgrep'}, --ripgrep
      {'sharkdp/fd'}, --finder
      {'nvim-treesitter/nvim-treesitter'}, --treesitter
      {'nvim-tree/nvim-web-devicons'}, --web dev icons
    }
}
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  use {'nvim-telescope/telescope-ui-select.nvim' }
  -- Indent line indicators
  use 'lukas-reineke/indent-blankline.nvim'
  -- Markdown and orgmode headlines
  use 'lukas-reineke/headlines.nvim'
  -- Dashboard
  use {
    'goolord/alpha-nvim',
    requires = {
    {'nvim-tree/nvim-web-devicons'},
    {'folke/persistence.nvim'},
    }
  }
  -- Which key
  use 'folke/which-key.nvim'
  -- Autocomments
  use 'terrortylor/nvim-comment'
  -- Git signs
  use 'lewis6991/gitsigns.nvim'
  -- todo list
  use {
    'folke/todo-comments.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'}
    }
  }
  -- Markdown preview
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  --Debug Adapter Protocol client
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'rcarriga/cmp-dap'
  use 'theHamsta/nvim-dap-virtual-text'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
