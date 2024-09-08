require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Map Ctrl-S to save in insert mode
vim.api.nvim_set_keymap("i", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })

-- Require and setup hop
local hop = require "hop"
hop.setup()

-- Custom mapping for hopjk
map("n", "gw", "<cmd>lua require'hop'.hint_words()<cr>")
map("v", "gw", "<cmd>lua require'hop'.hint_words()<cr>")

-- Configure hop to use two-char hints
hop.setup {
  keys = "etovxqpdygfblzhckisuran",
  jump_on_sole_occurrence = false,
  multi_windows = true,
}

-- Replace in Visual Mode
map("v", "R", "P", { noremap = true, silent = true })

-- Map Esc to Cancel find and replace using ':/'
map("n", "<Esc>", ":noh<CR>", opts)

-- Map d and dd to black hole instead of register
map("n", "d", '"_d', opts)
map("n", "dd", '"_dd', opts)

-- Map yank to yank and keep selection
map("v", "y", "ygv", opts)

-- Map space z to add double quotes to selected lines and connect them with commas
map("v", "<leader>z", ':s/\\(.*\\)\\n/\\"\\1",\\r<CR>:noh<CR>', opts)

-- Map numbers to tabs
map("n", "1", ":1tabn<CR>", opts)
map("n", "2", ":2tabn<CR>", opts)
map("n", "3", ":3tabn<CR>", opts)
map("n", "4", ":4tabn<CR>", opts)

-- Map space fe to open file explorer
map("n", "<leader>fe", ":NvimTreeToggle<CR>", opts)
map("v", "<leader>fe", "<Esc>:NvimTreeToggle<CR>", opts)

