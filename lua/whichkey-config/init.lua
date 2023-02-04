local wk = require("which-key")

wk.register({
  f = {
    name = "Find operations", -- file group name
    f = { "files" },
    g = { "string" },
    b = { "in buffers" },
    h = { "in help tags" },
    s = { "in document symbols" },
    S = { "in workspace symbols" },
    o = { "in recent files" },
    t = { "in treesitter" },
    c = { "in colorschemes" },
    d = { "in diagnostics" },
    q = { "in quickfix list" },
    l = { "in location list" },
  },
  h = {
    name = "Gitsigns hunk",
    S = { "stage buffer" },
    s = { "stage" },
    R = { "reset buffer" },
    r = { "reset" },
    p = { "preview" },
    B = { "toggle current line blame" },
    b = { "blame line" },
    t = { "toggle deleted" },
    d = { "diffthis" },
    D = { "diffthis previous commit" },
  },
  t = {
    name = "Terminal",
    n = { "new" },
    t = { "toggle" },
    h = { "prev" },
    l = { "next" },
    d = { "display TODO list" },
  },
  T = { "Trouble" },
  ["/"] = {
    name = "Comment",
    ["/"] = { "line" },
  },
  D = { "Show diagnostics" },
  K = { "Hover options" },
  c = {
    f = { "code format" },
  },
  e = { "open file explorer" },
  w = {
    name = "Workspace",
    a = { "add folder" },
    r = { "remove folder" },
    l = { "list folders" },
  },
  s = {
    "search",
    -- name = "signature",
    -- h = { "help" },
  },
  o = {
    name = "orgmode",
  }
}, { prefix = "<leader>" })

wk.register({
  name = "Go to",
  a = { "code actions" },
  s = { "type definition" },
  R = { "lsp rename symbol under cursor" },
  r = { "lsp references" },
  D = { "lsp declaration" },
  d = { "lsp definition" },
  I = { "lsp implementation" },
  n = {
    name = "treesitter functions",
    r = { "smart rename" },
    d = { "definition" },
    D = { "list definitions" },
    ["0"] = { "list definitions table of contents" },
  },
}, { prefix = "g" })

wk.setup({})
