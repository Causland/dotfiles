return {
  -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  opts = {
    -- See `:help gitsigns.txt`
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map({ 'n', 'v' }, '<leader>gn', function()
        if vim.wo.diff then
          return '<leader>gn'
        end
        vim.schedule(function()
          gs.next_hunk()
          end)
        return '<Ignore>'
      end, { expr = true, desc = 'Jump to [n]ext hunk' })

      map({ 'n', 'v' }, '<leader>gp', function()
        if vim.wo.diff then
          return '<leader>gp'
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return '<Ignore>'
      end, { expr = true, desc = 'Jump to [p]revious hunk' })

      -- Actions
      -- visual mode
      map('v', '<leader>gsh', function()
        gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'git [s]tage [h]unk' })
      map('v', '<leader>grh', function()
        gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'git [r]eset [h]unk' })
      -- normal mode
      map('n', '<leader>gsh', gs.stage_hunk, { desc = 'git [s]tage [h]unk' })
      map('n', '<leader>grh', gs.reset_hunk, { desc = 'git [r]eset [h]unk' })
      map('n', '<leader>gsb', gs.stage_buffer, { desc = 'git [s]tage [b]uffer' })
      map('n', '<leader>gu', gs.undo_stage_hunk, { desc = 'git [u]ndo stage hunk' })
      map('n', '<leader>grb', gs.reset_buffer, { desc = 'git [r]eset [b]uffer' })
      map('n', '<leader>gP', gs.preview_hunk, { desc = 'git [P]review hunk' })
      map('n', '<leader>gb', function()
        gs.blame_line { full = false }
      end, { desc = 'git blame line' })
      map('n', '<leader>gd', gs.diffthis, { desc = 'git [d]iff against index' })
      map('n', '<leader>gD', function()
        gs.diffthis '~'
      end, { desc = 'git [D]iff against last commit' })

      -- Toggles
      map('n', '<leader>gtb', gs.toggle_current_line_blame, { desc = '[t]oggle git [b]lame line' })
      map('n', '<leader>gtd', gs.toggle_deleted, { desc = '[t]oggle git show [d]eleted' })

      -- Text object
      map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'select git hunk' })
    end,
  },
}
