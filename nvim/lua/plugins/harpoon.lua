return {
  'ThePrimeagen/harpoon',
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  },
  config = function()
    local harpoon = require("harpoon")

    harpoon.setup()

    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end,
                   { desc = "[h]arpoon [a]dd" })
    vim.keymap.set("n", "<leader>hq", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
                   { desc = "[h]arpoon [q]uick menu" })

    -- Quick select options
    vim.keymap.set("n", "<leader>hh", function() harpoon:list():select(1) end,
                   { desc = "[h]arpoon select 1" })
    vim.keymap.set("n", "<leader>hj", function() harpoon:list():select(2) end,
                   { desc = "[h]arpoon select 2" })
    vim.keymap.set("n", "<leader>hk", function() harpoon:list():select(3) end,
                   { desc = "[h]arpoon select 3" })
    vim.keymap.set("n", "<leader>hl", function() harpoon:list():select(4) end,
                   { desc = "[h]arpoon select 4" })
    vim.keymap.set("n", "<leader>hl", function() harpoon:list():select(5) end,
                   { desc = "[h]arpoon select 5" })
    vim.keymap.set("n", "<leader>hl", function() harpoon:list():select(6) end,
                   { desc = "[h]arpoon select 6" })
    vim.keymap.set("n", "<leader>hl", function() harpoon:list():select(7) end,
                   { desc = "[h]arpoon select 7" })
    vim.keymap.set("n", "<leader>hl", function() harpoon:list():select(8) end,
                   { desc = "[h]arpoon select 8" })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end,
                   { desc = "[h]arpoon [p]rev" })
    vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end,
                   { desc = "[h]arpoon [n]ext" })

    -- basic telescope configuration
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
            table.insert(file_paths, item.value)
        end

        require("telescope.pickers").new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
                results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
        }):find()
    end

    vim.keymap.set("n", "<leader>hw", function() toggle_telescope(harpoon:list()) end,
                   { desc = "[h]arpoon [w]indow" })

    local harpoon_extensions = require("harpoon.extensions")
    harpoon:extend(harpoon_extensions.builtins.highlight_current_file())
  end,
}
