-- saving previous session
require("persistence").setup{
    event = "BufReadPre", --only start session saving when an actual file was opened
}

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
-- Set header
dashboard.section.header.val = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", "  > Find file", ":Telescope find_files<CR>"),
    dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "p", "  > Restore previous session"   , ":lua require('persistence').load({ last = true })<CR>"),
    dashboard.button( "s", "  > Settings" , ":e ~/.config/nvim/init.lua<CR>"),
    dashboard.button( "u", "  > Update Plugins" , ":PackerSync<CR>"),
    dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
}

-- quote
table.insert(dashboard.config.layout, { type = "padding", val = 1 })
table.insert(dashboard.config.layout, {
  type = "text",
  quote = require "alpha.fortune"(),
  val = "\t\t\tNAVIGATION:\n\n<C-t>    Open a new tab\n<C-Left>    Go to previous tab\n<C-Right>    Go to next tab\n<S-Right>    Split right\n<S-Down>    Split below\n<C-h>    Move to the window left\n<C-j>    Move to the window below\n<C-k>    Move to the window above\n<C-l>    Move to the window right",
  opts = {
    position = "center",
    hl = "AlphaQuote",
  },
})

-- footer
local function footer()
  local v = vim.version()
  local datetime = os.date " %d-%m-%Y   %H:%M:%S"
  local platform = vim.fn.has "win32" == 1 and "" or ""
  return string.format("  v%d.%d.%d %s  %s", v.major, v.minor, v.patch, platform, datetime)
end

dashboard.section.footer.val = footer()
-- Send config to alpha
alpha.setup(dashboard.opts)

-- hide tabline and statusline on startup screen
vim.api.nvim_create_augroup("alpha_tabline", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = "alpha_tabline",
  pattern = "alpha",
  command = "set showtabline=0 laststatus=0 noruler",
})

vim.api.nvim_create_autocmd("FileType", {
  group = "alpha_tabline",
  pattern = "alpha",
  callback = function()
    vim.api.nvim_create_autocmd("BufUnload", {
      group = "alpha_tabline",
      buffer = 0,
      command = "set showtabline=2 ruler laststatus=3",
    })
  end,
})
-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
