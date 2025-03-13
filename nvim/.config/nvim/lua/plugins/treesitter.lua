-- Customize Treesitter

---@type LazySpec
return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = {
			"lua",
			"vim",
			"go",
			"terraform",
			"rust",
			"typescript",
			"java",
			"python",
			"sql",
			-- add more arguments for adding more treesitter parsers
		},
	},
}
