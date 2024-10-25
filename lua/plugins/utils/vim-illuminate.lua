return {
  'RRethy/vim-illuminate',
  config = function()
    require('illuminate').configure({
      -- Delay in milliseconds before highlighting the word under the cursor
      delay = 200,
      -- File types where illuminate will be active
      filetypes_denylist = { 'NvimTree', 'TelescopePrompt' },
      -- Mode to use when determining references (buffer, cursor, or tree-sitter)
      modes_allowlist = { 'n', 'i' },
      -- Max number of references to highlight at once
      max_references = 10,
    })

    -- Keymap for navigating between highlighted references
    vim.api.nvim_set_keymap('n', '<A-n>', '<cmd>lua require("illuminate").next_reference{wrap=true}<CR>',
      { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<A-p>', '<cmd>lua require("illuminate").next_reference{reverse=true, wrap=true}<CR>',
      { noremap = true, silent = true })
  end,
}
