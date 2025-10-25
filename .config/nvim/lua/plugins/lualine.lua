local lualine    = require("lualine")

-- set
local foreground = "#cdd6f4"
local background = "#313244"
local theme      = {
  normal = {
    a = { fg = foreground, bg = background },
    b = { fg = foreground, bg = background },
    c = { fg = foreground, bg = background }
  },
  insert = {
    a = { fg = foreground, bg = background },
    b = { fg = foreground, bg = background },
  },
  visual = {
    a = { fg = foreground, bg = background },
    b = { fg = foreground, bg = background },
  },
  replace = {
    a = { fg = foreground, bg = background },
    b = { fg = foreground, bg = background },
  },
  command = {
    a = { fg = foreground, bg = background },
    b = { fg = foreground, bg = background },
  },
}

lualine.setup({
  options = {
    theme = theme,
    section_separators = { "", "" },
    component_separators = { "", "" },
  },
  sections = {
    lualine_a = {
      {
        "filename",
        newfile_status = true,
        path = 4,
      }
    },
    lualine_b = { "diagnostics" },
    lualine_c = { "branch", "diff" },
    lualine_x = { "filetype" },
    lualine_y = { "location" },
    lualine_z = { "progress" },
  },
})
