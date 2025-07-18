return {
	"shaunsingh/nord.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.nord_contrast = true
		vim.g.nord_borders = false
		vim.g.nord_disable_background = true
		vim.g.nord_italic = false
		vim.g.nord_uniform_diff_background = true
		vim.g.nord_bold = false
		require("nord").set()

		-- Function to set menu borders to transparent
		-- local set_menu_border_transparency = function()
		--   vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE', fg = 'NONE' })
		--   vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'NONE', fg = 'NONE' })
		-- end

		-- Execute the function once after loading the colorscheme
		-- set_menu_border_transparency()

		local bg_transparent = true

		-- Toggle background transparency
		local toggle_transparency = function()
			bg_transparent = not bg_transparent
			vim.g.nord_disable_background = bg_transparent
			vim.cmd([[colorscheme nord]])
			-- set_menu_border_transparency()
		end

		vim.keymap.set("n", "<leader>bg", toggle_transparency, { noremap = true, silent = true })
	end,
}
