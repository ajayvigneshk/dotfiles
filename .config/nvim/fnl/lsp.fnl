; keymappings func
(fn on-attach [client bufnr]
  (fn buf-set-keymap [...] (vim.api.nvim_buf_set_keymap bufnr ...))

  (fn buf-set-option [...] (vim.api.nvim_buf_set_option bufnr ...))

  ; todo - replace with nvim-cmp
  ; ((. (require :completion) :on_attach) client bufnr)
  (buf-set-option :omnifunc "v:lua.vim.lsp.omnifunc")
  (local opts {:noremap true :silent true})
  (buf-set-keymap :n :gD "<Cmd>lua vim.lsp.buf.declaration()<CR>" opts)
  (buf-set-keymap :n :gd "<Cmd>lua vim.lsp.buf.definition()<CR>" opts)
  (buf-set-keymap :n :K "<Cmd>lua vim.lsp.buf.hover()<CR>" opts)
  (buf-set-keymap :n :gi "<cmd>lua vim.lsp.buf.implementation()<CR>" opts)
  (buf-set-keymap :n :<C-k> "<cmd>lua vim.lsp.buf.signature_help()<CR>" opts)
  (buf-set-keymap :n :<leader>la "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>" opts)
  (buf-set-keymap :n :<leader>lr "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>" opts)
  (buf-set-keymap :n :<leader>ll "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>" opts)
  (buf-set-keymap :n :<leader>ls "<cmd>lua vim.lsp.buf.document_symbol()<CR>" opts)
  (buf-set-keymap :n :<leader>D "<cmd>lua vim.lsp.buf.type_definition()<CR>" opts)
  (buf-set-keymap :n :<leader>lr "<cmd>lua vim.lsp.buf.rename()<CR>" opts)
  (buf-set-keymap :n :gr "<cmd>lua vim.lsp.buf.references()<CR>" opts)
  (buf-set-keymap :n :<leader>e "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>" opts)
  (buf-set-keymap :n "[d" "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>" opts)
  (buf-set-keymap :n "]d" "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>" opts)
  (buf-set-keymap :n :<leader>q "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>" opts)

  ; Set some keybinds conditional on server capabilities
  (if client.resolved_capabilities.document_formatting
    (buf-set-keymap :n :<leader>f "<cmd>lua vim.lsp.buf.formatting()<CR>" opts)
    client.resolved_capabilities.document_range_formatting
    (buf-set-keymap :n :<leader>f "<cmd>lua vim.lsp.buf.range_formatting()<CR>" opts))

  ; Set autocommands conditional on server_capabilities
  (when client.resolved_capabilities.document_highlight
    (vim.api.nvim_exec 
      "hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
      autocmd! * <buffer>
      autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END" false)))

; setup different lsp configs
(local lspconfig (require :lspconfig))
(local lsp-config-setup 
  {:elixirls {:cmd [(.. (vim.fn.stdpath "data") :/lsp/elixir-ls/language_server.sh)]
              :on_attach on-attach
              :settings {:elixirLS {:dialyzerEnabled false }}
              }
  :gopls {:on_attach on-attach}
  :texlab {:cmd [:texlab]
           :on_attach on-attach}
  })

(local autocomplete-cmp (require :autocomplete-cmp))
(each [server-name server-config (pairs lsp-config-setup)]
  ((. lspconfig server-name :setup) ((. autocomplete-cmp :update-lspserver-config) server-config)))
