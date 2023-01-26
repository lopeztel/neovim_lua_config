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
 git = {
   enable = true,
   ignore = false, --show files in git ignore
   show_on_dirs = true,
   show_on_open_dirs = true,
   timeout = 400,
 },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false, --dont filter hidden files
  },
})
