return {
  -- Better marks [:help marks-setup]
  'chentoast/marks.nvim',
  config = function()
    require('marks').setup({
      -- which builtin marks to show. default {}
      builtin_marks = { ".", "<", ">", "^" },
      -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
      -- marks, and bookmarks.
      -- can be either a table with all/none of the keys, or a single number, in which case
      -- the priority applies to all marks.
      -- default 10.
      sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
      mappings = {}
    })

  end,
}
