return {
  -- Shows keybindings
  'folke/which-key.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'echasnovski/mini.icons',
  },
  config = function()
    local wk = require('which-key')

    -- Normal mode
    wk.add({
      { "<leader>c", group = "[c]ode" },
      { "<leader>c_", hidden = true },
      { "<leader>d", group = "[d]ocument" },
      { "<leader>d_", hidden = true },
      { "<leader>g", group = "[g]it" },
      { "<leader>g_", hidden = true },
      { "<leader>r", group = "[r]ename" },
      { "<leader>r_", hidden = true },
      { "<leader>s", group = "[s]earch" },
      { "<leader>s_", hidden = true },
      { "<leader>t", group = "[t]oggle" },
      { "<leader>t_", hidden = true },
      { "<leader>w", group = "[w]orkspace" },
      { "<leader>w_", hidden = true },
    }, { mode = 'n'})

    -- Visual mode
    wk.add({
      { "<leader>", group = "VISUAL <leader>", mode = "v" },
    }, { mode = 'v' })

  end,
}
