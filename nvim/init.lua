return {
  colorscheme = "sonokai",
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
  lsp = {
    config = {
      clangd = {
        capabilities = {
          offsetEncoding = "utf-8",
        },
      },
    },
  },
  -- Add plugins
  plugins = {
    -- { "AstroNvim/astrocommunity", dev = true },
    "AstroNvim/astrocommunity",
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
    { "williamboman/mason.nvim", opts = { PATH = "append" } },
    { import = "astrocommunity.pack.cpp" },
    { import = "astrocommunity.pack.proto" },
    { import = "astrocommunity.pack.ansible" },
    { import = "astrocommunity.pack.prisma" },
    { import = "astrocommunity.pack.markdown" },
    { import = "astrocommunity.pack.go" },
    { import = "astrocommunity.pack.json" },
    { import = "astrocommunity.pack.terraform" },
    { import = "astrocommunity.pack.lua" },
    { import = "astrocommunity.pack.rust" },
    { import = "astrocommunity.pack.python" },
    { import = "astrocommunity.pack.typescript" },
    { import = "astrocommunity.pack.bash" },
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
