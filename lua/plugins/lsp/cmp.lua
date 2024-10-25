return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",   -- source for text in buffer
    "hrsh7th/cmp-path",     -- source for file system paths
    "hrsh7th/cmp-nvim-lsp", -- LSP source for cmp
    "hrsh7th/cmp-nvim-lsp-signature-help"

  },
  config = function()
    -- nvim-cmp setup
    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)   -- Para LuaSnip
        end,
      },
      mapping = {
        ['<Up>'] = cmp.mapping.select_prev_item(),
        ['<Down>'] = cmp.mapping.select_next_item(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = false,
        }),
      },
      sources = {
        { name = 'nvim_lsp' }, -- LSP source
        { name = 'buffer' },   -- Buffer completions
        { name = 'path' },     -- Path completions
        { name = 'nvim_lsp_signature_help' }
      },
    })
  end,
}
