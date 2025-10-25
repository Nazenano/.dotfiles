-- treesitter autocmd provided by cameronr
vim.api.nvim_create_autocmd("FileType", {
  callback = function(event)
    local ignored_fts = {
      "snacks_dashboard",
      "snacks_notif",
      "snacks_input",
      "prompt",
    }

    if vim.tbl_contains(ignored_fts, event.match) then return end

    local ok, nvim_treesitter = pcall(require, "nvim-treesitter")

    if not ok then return end

    local ft = vim.bo[event.buf].ft
    local lang = vim.treesitter.language.get_lang(ft)
    nvim_treesitter.install({ lang }):await(function(err)
      if err then
        vim.notify("Treesitter install error for ft: " .. ft .. " err: " .. err)
        return
      end

      pcall(vim.treesitter.start, event.buf)
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    end)
  end,
})

-- enable keymaps for language specific actions
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_attach", {}),
  callback = function(e)
    local opts = { buffer = e.buf }
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  end
})

-- highlight selection on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", {}),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 40,
    })
  end,
})

-- remove whitespaces
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("remove_whitespaces", {}),
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

-- save cursor location
vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("save_cursor", {}),
  pattern = "*",
  command = [[call setpos(".", getpos("'\""))]]
})

local function clear_commandline()
  local timer
  return function()
    if timer then
      timer:stop()
    end
    timer = vim.defer_fn(function()
      if vim.fn.mode() == "n" then
        vim.cmd([[echon '']])
      end
    end, 10000)
  end
end

-- clear command line after a timer
vim.api.nvim_create_autocmd({ "CmdlineLeave", "CmdlineChanged" }, {
  pattern = ":",
  callback = clear_commandline(),
})
