packadd nvim-lspconfig
packadd nvim-treesitter
packadd completion-nvim
lua << EOF
local lspconfig = require'lspconfig'
lspconfig.gopls.setup{
	autostart=false;
	on_attach=on_attach;
}
require'lspconfig'.gopls.autostart{}
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
EOF
