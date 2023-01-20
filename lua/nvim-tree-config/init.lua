require("nvim-tree").setup({
  sort_by = "case_sensitive",
--  auto_close = true,
  diagnostics = {
    enable = true,
  },
  view = {
    adaptive_size = true,
--     mappings = {
--       list = {
--         { key = "u", action = "dir_up" },
--       },
--     },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false, --dont filter hidden files
  },
})
