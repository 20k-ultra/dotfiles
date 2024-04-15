-- bootstreap lazy package manager
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- manage plugins
local plugins = {
  { "AstroNvim/AstroNvim", version = "^4", import = "astronvim.plugins" },

  "AstroNvim/astrocommunity",
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

  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          L = {
            function()
              require("astrocore.buffer").nav(vim.v.count1)
            end,
            desc = "Next buffer",
          },
          H = {
            function()
              require("astrocore.buffer").nav(-vim.v.count1)
            end,
            desc = "Previous buffer",
          },
        },
      },
      options = {
        opt = {
          mouse = "",
          listchars = { tab = "│→", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" },
          showbreak = "↪ ",
          wrap = true,
        },
      },
    },
  },
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      colorscheme = "sonokai",
    },
  },

  { "20k-ultra/sonokai" },
  { "PratikBhusal/vim-grip", event = "VeryLazy" },
  { "williamboman/mason.nvim", opts = { PATH = "append" } },
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astroui.status"
      opts.tabline[2] = status.heirline.make_buflist(status.component.tabline_file_info { close_button = false })
    end,
  },
}

-- initialize lazy
require("lazy").setup {
  spec = plugins,
  ui = { backdrop = 100 },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      },
    },
  },
}
