vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load lsp
require("lspconfig").emmet_ls.setup {}
require("lspconfig").ts_ls.setup {}

-- ref: https://www.reddit.com/r/neovim/comments/16ugm8l/vs_codelike_expand_selection_via_treesitter/
require("nvim-treesitter.configs").setup {
}

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

require('telescope').setup{ 
  defaults = { 
    file_ignore_patterns = { 
      "node_modules",
      "ios/Pods",
      "vendor/bundle",
      "android/app/build"
    }
  }
}

vim.g.vscode_snippets_path = "~/.config/nvim/lua/snippets"
