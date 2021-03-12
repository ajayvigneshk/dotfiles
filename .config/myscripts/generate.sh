#!/bin/bash
# Used to generate files that are not maintained by me and need to be sourced from somehwere 
curl https://raw.githubusercontent.com/golang/vscode-go/master/snippets/go.json --output ~/.config/vsnip/go.json
# the file is not directly usable as a json (would need manual editing)
curl https://raw.githubusercontent.com/microsoft/vscode/main/extensions/markdown-basics/snippets/markdown.code-snippets --output ~/.config/vsnip/markdown.json
