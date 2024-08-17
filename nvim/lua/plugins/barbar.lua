return {
  -- Buffer bar at top of screen
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {},
  config = function()
    require('barbar').setup {
      auto_hide = 1,
      focus_on_close = 'previous',
      icons = {
        buffer_number = true,
      },
    }

    vim.keymap.set('n', '<leader>bp', '<Cmd>BufferPrevious<CR>', { desc = '[b]uffer [p]revious', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>bn', '<Cmd>BufferNext<CR>', { desc = '[b]uffer [n]ext', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>bc', '<Cmd>BufferClose<CR>', { desc = '[b]uffer [c]lose', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>bC', '<Cmd>BufferCloseAllButCurrent<CR>', { desc = '[b]uffer [C]lose all but current', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>bP', '<Cmd>BufferPick<CR>', { desc = '[b]uffer [P]ick mode', noremap = true, silent = true })
  end,
}
