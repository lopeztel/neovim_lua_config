require('notify').setup({
  background_colour = "#000000", --transparent background
  render = "default", --default style rendering
})

-- NOTE: The following is added to suppress null-ls warnings about different client
-- offset encodings
local notify = vim.notify
vim.notify = function(msg, ...)
  if msg:match("warning: multiple different client offset_encodings") then
    return
  end
  notify(msg, ...)
end
