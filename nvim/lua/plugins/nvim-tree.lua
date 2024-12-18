return {
  -- Tree plugins
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require("nvim-tree").setup({
      hijack_cursor = true,
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        float = {
          enable = true,
          open_win_config = {
            width = 40,
          }
        },
      },
      renderer = {
        group_empty = true,
        icons = {
          show = {
            modified = true,
            hidden = true,
          },
        },
      },
      modified = {
        enable = true,
      },
      update_focused_file = {
        enable = true,
      },
      git = {
        enable = true,
        ignore = false,
      }
    })

    vim.keymap.set('n', '<leader>n', require("nvim-tree.api").tree.toggle, { desc = '[n]vim-tree toggle' })
    vim.keymap.set('n', '<leader>Nf', require("nvim-tree.api").tree.focus, { desc = '[N]vim-tree [f]ocus' })
    vim.keymap.set('n', '<leader>Nr', require("nvim-tree.api").tree.reload, { desc = '[N]vim-tree [r]efresh' })
    vim.keymap.set('n', '<leader>Nc', require("nvim-tree.api").tree.collapse_all, { desc = '[N]vim-tree [c]ollapse' })
    vim.keymap.set('n', '?', require("nvim-tree.api").tree.toggle_help, { desc = '[n]vim-tree help' })

    -- Perform on VimEnter
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        -- open tree on startup if file not provided
        if next(vim.fn.argv()) == nil then
          vim.cmd [[:NvimTreeOpen]]
        end
      end
    })
  end,
}
