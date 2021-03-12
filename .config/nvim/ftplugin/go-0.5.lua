vim.api.nvim_command("setlocal hidden")
vim.api.nvim_command("setlocal number")
vim.api.nvim_command("setlocal signcolumn=yes")
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
