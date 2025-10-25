local cloak = require("cloak")

-- set
cloak.setup({
  enabled = true,
  cloak_character = "*",
  highlight_group = "Comment",
  patterns = { { file_pattern = { ".env*" }, cloak_pattern = "=.+" } },
})

-- remap
vim.keymap.set("n", "<leader>tc", vim.cmd.CloakToggle, { desc = "Toggle cloak on env files" })
