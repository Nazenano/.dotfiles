local md = require('render-markdown')

-- set
md.setup({
  code = {
    inline = false
  }
})

-- remap
vim.keymap.set("n", "<leader>rm", function() md.preview() end, { desc = "Preview markdown file" })
