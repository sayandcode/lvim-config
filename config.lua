-- general
vim.opt.relativenumber = true
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
vim.go.background = "light"
lvim.colorscheme = "onelight"
lvim.transparent_window = true

-- null-ls timeout
lvim.builtin.which_key.mappings["l"]["f"] = {
  function()
    require("lvim.lsp.utils").format { timeout_ms = 12000 }
  end,
  "Format",
}

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- Prettier Eslint
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup {
  {
    command = "eslint_d",
    filetypes = { "typescript", "typescriptreact", "javascriptreact", "javascript", "astro" }
  }
}

local linters = require("lvim.lsp.null-ls.linters")
linters.setup {
  {
    command = "eslint_d",
    filetypes = { "typescript", "typescriptreact", "javascriptreact", "javascript", "astro" }
  }
}

local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
  {
    exe = "eslint_d",
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "astro" }
  }
}

-- Additional Plugins
lvim.plugins = {
  {
    "olimorris/onedarkpro.nvim",
    require("onedarkpro").setup({
      theme = "onelight",
      colors = {
        -- bg = "#ffffff",
        bg = "#e6d5b1",
        fg = "#000000",
        orange = "#155B98",
        yellow = "#5425ee",
        green = "#0f5a09",
        purple = "#00289e",
        gray = "#008F81",
        comment = "#5e5e64",
        highlight = "#ffffff"
      },
      styles = {
        operators = "bold",
      },
      options = {
        transparency = true
      }
    }),
  },
  { "wuelnerdotexe/vim-astro" }
}
