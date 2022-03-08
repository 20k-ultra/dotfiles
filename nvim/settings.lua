local config = {

	-- Add plugins
	plugins = {
		{
			"20k-ultra/sonokai",
			config = function()
				vim.api.nvim_set_var("sonokai_style", "20k-ultra")
			end,
		},
	},

	-- Set colorscheme
	colorscheme = "sonokai",

	overrides = {
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
	},

	-- On/off virtual diagnostics text
	virtual_text = true,

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
		neoscroll = true,
		ts_rainbow = true,
		ts_autotag = true,
	},

	packer_file = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",

	polish = function()
		local opts = { noremap = true, silent = true }
		local map = vim.api.nvim_set_keymap
		local set = vim.opt

		-- Set options
		set.relativenumber = false

		-- Set key bindings
		map("n", "<C-s>", ":w!<CR>", opts)

		-- Set autocommands
		vim.cmd([[
      augroup packer_conf
        autocmd!
        autocmd bufwritepost plugins.lua source <afile> | PackerSync
      augroup end
    ]])
	end,
}

return config
