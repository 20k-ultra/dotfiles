return {
  colorscheme = "sonokai",

  -- TODO REMOVE AFTER v3 RELEASE
  updater = { channel = "nightly" },

  -- Add plugins
  plugins = {
    { "20k-ultra/sonokai" },
    { "ellisonleao/glow.nvim", cmd = "Glow" },

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
          "rust",
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
          "rust_analyzer",
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
