local harpoon = require("harpoon")

-- set
harpoon.setup()

-- remap
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Add to the list" })
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Open harpoon list" })
vim.keymap.set("n", "<C-p>", function() harpoon:list():prev() end, { desc = "Jump to previous" })
vim.keymap.set("n", "<C-n>", function() harpoon:list():next() end, { desc = "Jump to next" })
