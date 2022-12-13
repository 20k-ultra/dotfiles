local config = {
  colorscheme = "sonokai",

  -- Add plugins
  plugins = {
    init = {
      { "ellisonleao/glow.nvim" },
      { "20k-ultra/sonokai" },
    },
    treesitter = {
      ensure_installed = {
        "lua",
        "rust",
        "typescript",
        "javascript",
        "tsx",
        "bash",
        "markdown",
      },
    },
    bufferline = {
      options = {
        show_buffer_close_icons = false,
        show_buffer_icons = false,
        show_close_icon = false,
      },
    },
    ["mason-lspconfig"] = {
      ensure_installed = {
        "rust_analyzer",
        "bashls",
        "sumneko_lua",
        "tsserver",
        "jsonls",
        "pyright",
      },
    },
    ["mason-null-ls"] = {
      ensure_installed = {
        "shellcheck",
        "shfmt",
        "prettier",
        "stylua",
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

return config
