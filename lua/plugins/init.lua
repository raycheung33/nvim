return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Hop
  {
    "phaazon/hop.nvim",
    branch = "v2",
    event = "BufRead",
    config = function()
      require("hop").setup()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "javascript",
        "typescript",
        "html",
        "css",
        "json",
      },
    },
  },

  -- Session save and load
  -- save location: ~/.local/share/nvim/sessions
  {
    "olimorris/persisted.nvim",
    lazy = false,
    event = "VimEnter",
    config = function()
      require("persisted").setup {
        save_dir = vim.fn.expand(vim.fn.stdpath "data" .. "/sessions/"),
        use_git_branch = true,
        autosave = true,
        autoload = true,
        on_autoload_no_session = function()
          vim.notify "No existing session to load."
        end,
        should_save = function()
          return true
        end,
      }
    end,
  },
}
