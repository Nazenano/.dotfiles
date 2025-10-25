-- set
-- treesitter => highlighting
if vim.fn.exists(":TSUpdate") == 2 then vim.cmd("TSUpdate") end
local ensure_installed = { "vimdoc", "javascript", "typescript", "json", "c", "lua", "rust", "tsx", "python" }
local ok, treesitter = pcall(require, "nvim-treesitter")
if not ok then return end
treesitter.install(ensure_installed)

-- mason => lsp manager
require("mason").setup()

-- blink => completion
local blink = require("blink.cmp")
local ls = require("luasnip")
blink.setup({
  fuzzy = { implementation = "prefer_rust_with_warning" },
  keymap = { preset = "default" },
  appearance = { use_nvim_cmp_as_default = true, nerd_font_variant = "normal" },
  completion = { accept = { auto_brackets = { enabled = false } } },
  snippets = { expand = function(args) ls.lsp_expand(args.body) end },
  signature = { enabled = true },
})

-- fidget => notifications / info
require("fidget").setup({
  notification = {
    window = { winblend = 0 },
    override_vim_notify = true,
  }
})

-- trouble => diagnostics
require("trouble").setup({
  auto_close = true,
  auto_preview = true,
  use_diagnostic_signs = true,
  padding = true,
  focus = true,
})

-- luasnip => snipets
require("luasnip.loaders.from_vscode").lazy_load()

-- capabilities
local capabilities = blink.get_lsp_capabilities()
vim.lsp.config["*"] = { capabilities = capabilities }

vim.lsp.config["lua_ls"] = {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim", "it", "describe", "before_each", "after_each" } },
    },
  },
}

vim.lsp.config["csharp_ls"] = {
  capabilities = capabilities,
  handlers = {
    ["window/showMessage"] = function(_, method, params)
      require("fidget").notify(params.message, vim.log.levels.INFO)
    end,
  },
}

vim.lsp.config["eslint"] = {
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,
      { buffer = bufnr, noremap = true, silent = true })
  end,
  settings = {
    codeAction = {
      disableRuleComment = { enable = true, location = "separateLine" },
      showDocumentation = { enable = true }
    }
  }
}

-- enable lsp
vim.lsp.enable({
  "lua_ls", "rust_analyzer", "clangd", "csharp_ls", "pyright", "tailwindcss",
  "html", "cssls", "bashls", "eslint", "ts_ls", "json", "dockerls"
})

-- conform => formatting
local conform = require("conform")
conform.setup({
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    lua = { "stylua" },
    python = { "isort", "black" },
    rust = { "rustfmt", lsp_format = "fallback" },
  },
  formatters = { prettier = { prefer_local = "node_modules/.bin" } },
})

-- remap
vim.keymap.set("n", "<leader>f", function() conform.format({ async = true, lsp_fallback = true }) end,
  { desc = "Format current buffer" })
vim.keymap.set({ "i", "s" }, "<C-e>", function() ls.expand_or_jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-K>", function() ls.jump(-1) end, { silent = true })
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>")
