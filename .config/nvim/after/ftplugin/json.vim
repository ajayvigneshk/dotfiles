lua << EOF
if vim.treesitter.language.require_language("json", nil, true) then
	vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
	vim.opt_local.foldmethod = "expr"
else
      vim.opt_local.foldmethod = "syntax"
end
EOF
setlocal ts=2 sts=2 sw=2 expandtab
setlocal number
setlocal nofoldenable
