return {
  -- Indent line and whitespace view 
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    require('ibl').setup({
      indent = {
        char = '▏',
      },
    })
  end,
}

