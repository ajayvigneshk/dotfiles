local lspconfig = require'lspconfig'
local elixirlspath = os.getenv("HOME") .. "/.config/nvim/lsp_installs/elixir-ls/language_server.sh"
lspconfig.elixirls.setup{
	cmd={elixirlspath};
	cmd_env= {
		RUST_BACKTRACE = "full"
	};
	on_attach=on_attach;
}
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true
  }
}
