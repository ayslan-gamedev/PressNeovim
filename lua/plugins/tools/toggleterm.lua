return {
  'akinsho/toggleterm.nvim',
  config = function()
    require('toggleterm').setup({
      size = 20,
      open_mapping = [[<c-\>]],
      direction = 'horizontal',
      autochdir = true,
      float_opts = {
        border = 'curved',
        winblend = 3,
      },
    })

    -- Keymaps para o toggleterm usando a leader key
    local keys = {
      { "<leader>tt", "<cmd>ToggleTerm<CR>", desc = "Toggle Terminal" },
    }

    -- Registrar as teclas
    for _, key in ipairs(keys) do
      vim.api.nvim_set_keymap('n', key[1], key[2], { noremap = true, silent = true })
      vim.api.nvim_set_keymap('t', key[1], key[2], { noremap = true, silent = true })
    end
  end,
}
