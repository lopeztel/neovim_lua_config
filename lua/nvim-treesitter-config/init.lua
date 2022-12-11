require("nvim-treesitter.configs").setup{
  -- A list of parser names, or "all"
  ensure_installed = {
    "cpp",
    "lua",
    "bash",
    "c",
    "cmake",
    "yaml",
    "python",
    "make",
    "markdown",
    "latex",
    "json"
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,

  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
--     disable = { "c", "rust" }, -- disable highlight for selected languages
  },
  refactor = {
    highlight_definitions = {
      enable = true,
      -- Set to false if you have an `updatetime` of ~100.
      clear_on_cursor_move = true,
    },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "gnr",
      }
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd",
        list_definitions = "gnD",
        list_definitions_toc = "gnO",
        goto_next_usage = "<A-*>",
        goto_previous_usage = "<A-#>",
      },
    },
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  }
}

require("treesitter-context").setup()
