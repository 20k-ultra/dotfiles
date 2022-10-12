local null_ls = require "null-ls"

local config = {
  -- Add plugins
  plugins = {
    init = {
      { "ellisonleao/glow.nvim" },
      { "20k-ultra/sonokai" },
    },
    treesitter = {
      ensure_installed = { "lua" },
    },
    bufferline = {
      options = {
        show_buffer_close_icons = false,
        show_buffer_icons = false,
        show_close_icon = false,
      },
    },
    packer = {
      compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
    },
    ["null-ls"] = function(config)
      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set sources here
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.formatting.shfmt,
      }
      -- set up null-ls's on_attach function
      -- NOTE: You can remove this on attach function to disable format on save
      config.on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
          vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Auto format before save",
            pattern = "<buffer>",
            callback = vim.lsp.buf.formatting_sync,
          })
        end
      end
      return config -- return final config table to use in require("null-ls").setup(config)
    end
  },

  colorscheme = "sonokai",

  diagnostics = {
    virtual_text = true,
  },

  -- Disable default plugins
  enabled = {
    bufferline = true,
    nvim_tree = true,
    lualine = true,
    lspsaga = true,
    gitsigns = true,
    colorizer = true,
    toggle_term = true,
    comment = true,
    symbols_outline = true,
    indent_blankline = true,
    dashboard = true,
    which_key = true,
    ts_rainbow = true,
    ts_autotag = true,
  },

  polish = function()
    local opts = { noremap = true, silent = true }
    local map = vim.api.nvim_set_keymap
    local set = vim.opt

    -- Set options
    set.relativenumber = true 
    set.mouse = ""
    set.list = false
    set.listchars = {
      tab = "│→",
      extends = "⟩",
      precedes = "⟨",
      trail = "·",
      nbsp = "␣",
    }
    set.showbreak = "↪ "
    set.wrap = true
    set.linebreak = true
    --
    -- Set key bindings
    map("n", "<C-s>", ":w!<CR>", opts)

    -- Set autocommands
    vim.cmd [[
      augroup packer_conf
        autocmd!
        autocmd bufwritepost plugins.lua source <afile> | PackerSync
      augroup end
    ]]
  end,
}

return config
