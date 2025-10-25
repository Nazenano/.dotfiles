local telescope = require("telescope")
local builtin = require("telescope.builtin")

-- set
telescope.setup({
  defaults = {
    preview = { treesitter = false },
    color_devicons = true,
    sorting_strategy = "ascending",
    borderchars = {
      "─", -- top
      "│", -- right
      "─", -- bottom
      "│", -- left
      "┌", -- top-left
      "┐", -- top-right
      "┘", -- bottom-right
      "└", -- bottom-left
    },
    path_displays = { "smart" },
    layout_config = {
      height = 100,
      width = 400,
      prompt_position = "top",
      preview_cutoff = 40,
    }
  }
})

-- remap
vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>g", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>gs", builtin.grep_string, { desc = "Live string" })
vim.keymap.set("n", "<leader>so", builtin.oldfiles, { desc = "Seek recently opened files" })
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Seek help tags" })
vim.keymap.set("n", "<leader>sm", builtin.man_pages, { desc = "Seek man pages" })
vim.keymap.set("n", "<leader>sr", builtin.lsp_references, { desc = "Seek lsp references" })
