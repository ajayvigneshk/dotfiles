curl -fLO https://github.com/elixir-lsp/elixir-ls/releases/latest/download/elixir-ls.zip
mkdir -p $HOME/.config/nvim/lsp_installs
unzip elixir-ls.zip -d $HOME/.config/nvim/lsp_installs/elixir-ls
# Unix
chmod +x $HOME/.config/nvim/lsp_installs/elixir-ls/language_server.sh
