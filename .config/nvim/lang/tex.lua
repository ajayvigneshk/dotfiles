local lspconfig = require'lspconfig'
lspconfig.texlab.setup{
	cmd={"texlab"};
	cmd_env= {
		RUST_BACKTRACE = "full"
	};
	on_attach=on_attach;
}
