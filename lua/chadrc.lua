-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

vim.cmd "highlight St_relativepath guifg=#626a83 guibg=#2a2b36"

local stbufnr = function()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end

M.ui = {
  statusline = {
    theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "round",
    order = { "mode", "relativepath", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" },
    -- order = { "mode", "relativepath", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" },
    -- order = nil,
    -- modules = nil,
    modules = {
      relativepath = function()
        local utils = require "nvchad.stl.utils"
        local path = vim.api.nvim_buf_get_name(stbufnr())

        if path == "" then
          return ""
        end

        local x = utils.file()
        local name = " " .. x[2] .. " "
        print(name)
        return " %#StText#" .. x[1] .. " " .. vim.fn.expand "%" .. "  "
      end,
    },
  },
}

M.base46 = {
	theme = "nightowl",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

return M
