return {
  colorscheme = "sonokai",
  -- TODO REMOVE AFTER v3 RELEASE
  updater = { channel = "nightly" },
  mappings = {
    n = {
      ["<S-l>"] = {
        function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
        desc = "Next buffer",
      },
      ["<S-h>"] = {
        function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
        desc = "Previous buffer",
      },
    },
  },
  -- Add plugins
  plugins = {
    "AstroNvim/astrocommunity",
    { import = "astrocommunity.pack.rust" },
    { "20k-ultra/sonokai" },
    {
      "PratikBhusal/vim-grip",
      event = "VeryLazy",
    },
    {
      "rebelot/heirline.nvim",
      opts = function(_, opts)
        local status = require "astronvim.utils.status"
        opts.tabline[2] = status.heirline.make_buflist(status.component.tabline_file_info { close_button = false })
        return opts
      end,
    },
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        ensure_installed = {
          "bash",
          "javascript",
          "lua",
          "markdown",
          "tsx",
          "typescript",
        },
      },
    },
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed = {
          "bashls",
          "jsonls",
          "lua_ls",
          "pyright",
          "tsserver",
        },
      },
    },
    {
      "jay-babu/mason-null-ls.nvim",
      opts = {
        ensure_installed = {
          "prettier",
          "shellcheck",
          "shfmt",
          "stylua",
        },
      },
    },
  },
  options = {
    opt = {
      mouse = "",
      list = false,
      listchars = {
        tab = "│→",
        extends = "⟩",
        precedes = "⟨",
        trail = "·",
        nbsp = "␣",
      },
      showbreak = "↪ ",
      wrap = true,
      linebreak = true,
    },
  },
}
