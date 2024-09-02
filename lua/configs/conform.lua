local options = {
  lazy = false,

  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier"},
    typescript = { "prettier"},
    javascriptreact = { "prettier"},
    typescriptreact = { "prettier"},
    json = { "prettier"},
    markdown = { "prettier"}

  },

  format_on_save = {
  -- These options will be passed to conform.format()
    async = false,
    timeout_ms = 500,
    lsp_fallback = true
  },
}

return options
