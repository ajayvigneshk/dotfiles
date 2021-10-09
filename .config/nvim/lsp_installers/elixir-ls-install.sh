INSTALL_DIR="$HOME/.local/share/nvim/lsp"
mkdir -p $INSTALL_DIR
curl -o $INSTALL_DIR/elixir-ls.zip -fLO https://github.com/elixir-lsp/elixir-ls/releases/latest/download/elixir-ls.zip
unzip $INSTALL_DIR/elixir-ls.zip -d $INSTALL_DIR/elixir-ls
# Unix
chmod +x $INSTALL_DIR/elixir-ls/language_server.sh
