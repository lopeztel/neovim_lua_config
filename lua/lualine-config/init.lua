local function lualine_lsp()
  local client_names = {}
  for _, client in ipairs(vim.lsp.get_active_clients()) do
    if client.name ~= "null-ls" then
      table.insert(client_names, client.name)
    end
  end
  local m = require("null-ls.methods")
  local s = require("null-ls.sources")
  local bufnr = vim.api.nvim_get_current_buf()
  local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
  for _,formatter in ipairs(s.get_available(ft, m.FORMATTING)) do
    if formatter.name ~= "gitsigns" then
      table.insert(client_names, formatter.name)
    end
  end
  for _,diagnostic in ipairs(s.get_available(ft, m.DIAGNOSTICS)) do
    if diagnostic.name ~= "gitsigns" then
      table.insert(client_names, diagnostic.name)
    end
  end
  for _,ca in ipairs(s.get_available(ft, m.CODE_ACTION)) do
    if ca.name ~= "gitsigns" then
      table.insert(client_names, ca.name)
    end
  end
  local unique_client_names = vim.fn.uniq(client_names)
  return table.concat(unique_client_names, ",")
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = '' },
    -- component_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = { },
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename', 'lsp_progress'},
    -- lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_x = { lualine_lsp, 'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
