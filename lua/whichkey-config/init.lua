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
      },
  t = {
        name = "Terminal",
        n = { "new" },
        t = { "toggle" },
        h = { "prev" },
        l = { "next" },
        d = { "display TODO list" },
      },
  ["/"] = {
    name = "Comment",
    ["/"] = {"line"}
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
        name = "signature",
        h = { "help" },
      },
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
    r = {"smart rename"},
    d = {"definition"},
    D = {"list definitions"},
    ["0"] = {"list definitions table of contents"},
  },
  }, { prefix = "g" })

wk.setup {}
