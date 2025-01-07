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
map("n", "x", '"_x', opts)
map("n", "c", '"_c', opts)

map("v", "d", '"_d', opts)
map("v", "dd", '"_dd', opts)
map("v", "x", '"_x', opts)
map("v", "c", '"_c', opts)

-- Map yank to yank and keep selection
map("v", "y", "ygv", opts)

-- Map space z to add double quotes to selected lines and connect them with commas
map("v", "<leader>z", ':s/\\(.*\\)\\n/\\"\\1",\\r<CR>:noh<CR>', opts)

-- Map numbers to tabs
map("n", "1", ":cd ~/hkust/ServerDC/<CR>:1tabn<CR>", opts)
map("n", "2", ":cd ~/hkust/ServerDC/<CR>:2tabn<CR>", opts)
map("n", "3", ":cd ~/hkust/ServerDC/<CR>:3tabn<CR>", opts)
map("n", "4", ":cd ~/hkust/DCOZ/<CR>:4tabn<CR>", opts)
map("n", "5", ":cd ~/hkust/DCOZ/<CR>:5tabn<CR>", opts)
map("n", "6", ":cd ~/hkust/DCOZ/<CR>:6tabn<CR>", opts)
map("n", "7", ":cd ~/hkust/DCOZ/<CR>:7tabn<CR>", opts)
map("n", "8", ":cd ~/hkust/DCOZ/<CR>:8tabn<CR>", opts)
map("n", "9", ":cd ~/hkust/DCOZ/<CR>:9tabn<CR>", opts)
map("n", "0", ":cd ~/.config/nvim/<CR>:10tabn<CR>", opts)

map("v", "1", "<Esc>:cd ~/hkust/ServerDC/<CR>:1tabn<CR>", opts)
map("v", "2", "<Esc>:cd ~/hkust/ServerDC/<CR>:2tabn<CR>", opts)
map("v", "3", "<Esc>:cd ~/hkust/ServerDC/<CR>:3tabn<CR>", opts)
map("v", "4", "<Esc>:cd ~/hkust/DCOZ/<CR>:4tabn<CR>", opts)
map("v", "5", "<Esc>:cd ~/hkust/DCOZ/<CR>:5tabn<CR>", opts)
map("v", "6", "<Esc>:cd ~/hkust/DCOZ/<CR>:6tabn<CR>", opts)
map("v", "7", "<Esc>:cd ~/hkust/DCOZ/<CR>:7tabn<CR>", opts)
map("v", "8", "<Esc>:cd ~/hkust/DCOZ/<CR>:8tabn<CR>", opts)
map("v", "9", "<Esc>:cd ~/hkust/DCOZ/<CR>:9tabn<CR>", opts)
map("v", "0", "<Esc>:cd ~/.config/nvim/<CR>:10tabn<CR>", opts)

-- Map space e to open file explorer in visual mode
map("v", "<leader>e", "<Esc>:NvimTreeFocus<CR>", opts)

-- Map space r to change varible name
map("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
map("v", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

-- Map Cmd-J and Cmd-K to move cursor down and up 10 lines
map("n", "[custom_j", "10j", opts)
map("n", "[custom_k", "10k", opts)

-- Map cd, cs and cn change working directories
map("n", "cd", ":cd ~/hkust/DCOZ/<CR>", opts)
map("n", "cs", ":cd ~/hkust/ServerDC/<CR>", opts)
map("n", "cn", ":cd ~/.config/nvim/<CR>", opts)
map("v", "cd", "<Esc>:cd ~/hkust/DCOZ/<CR>", opts)
map("v", "cs", "<Esc>:cd ~/hkust/ServerDC/<CR>", opts)
map("v", "cn", "<Esc>:cd ~/.config/nvim/<CR>", opts)
