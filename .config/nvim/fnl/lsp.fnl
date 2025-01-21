; Auto generated from neovim kickstarter
(vim.api.nvim_create_autocmd :LspAttach
                             {:callback (fn [event]
                                          (fn map [keys func desc]
                                            (vim.keymap.set :n keys func
                                                            {:buffer event.buf
                                                             :desc (.. "LSP: "
                                                                       desc)}))

                                          (map :gd
                                               (. (require :telescope.builtin)
                                                  :lsp_definitions)
                                               "[G]oto [D]efinition")
                                          (map :gr
                                               (. (require :telescope.builtin)
                                                  :lsp_references)
                                               "[G]oto [R]eferences")
                                          (map :gI
                                               (. (require :telescope.builtin)
                                                  :lsp_implementations)
                                               "[G]oto [I]mplementation")
                                          (map :<leader>D
                                               (. (require :telescope.builtin)
                                                  :lsp_type_definitions)
                                               "Type [D]efinition")
                                          (map :<leader>ds
                                               (. (require :telescope.builtin)
                                                  :lsp_document_symbols)
                                               "[D]ocument [S]ymbols")
                                          (map :<leader>ws
                                               (. (require :telescope.builtin)
                                                  :lsp_dynamic_workspace_symbols)
                                               "[W]orkspace [S]ymbols")
                                          (map :<leader>rn vim.lsp.buf.rename
                                               "[R]e[n]ame")
                                          (map :<leader>ca
                                               vim.lsp.buf.code_action
                                               "[C]ode [A]ction")
                                          (map :K vim.lsp.buf.hover
                                               "Hover Documentation")
                                          (map :gD vim.lsp.buf.declaration
                                               "[G]oto [D]eclaration")
                                          (local client
                                                 (vim.lsp.get_client_by_id event.data.client_id))
                                          (when (and client
                                                     client.server_capabilities.documentHighlightProvider)
                                            (local highlight-augroup
                                                   (vim.api.nvim_create_augroup :kickstart-lsp-highlight
                                                                                {:clear false}))
                                            (vim.api.nvim_create_autocmd [:CursorHold
                                                                          :CursorHoldI]
                                                                         {:buffer event.buf
                                                                          :callback vim.lsp.buf.document_highlight
                                                                          :group highlight-augroup})
                                            (vim.api.nvim_create_autocmd [:CursorMoved
                                                                          :CursorMovedI]
                                                                         {:buffer event.buf
                                                                          :callback vim.lsp.buf.clear_references
                                                                          :group highlight-augroup}))
                                          (when (and (and client
                                                          client.server_capabilities.inlayHintProvider)
                                                     vim.lsp.inlay_hint)
                                            (map :<leader>th
                                                 (fn []
                                                   (vim.lsp.inlay_hint.enable (not (vim.lsp.inlay_hint.is_enabled))))
                                                 "[T]oggle Inlay [H]ints"))
                                          (when (and client
                                                     client.server_capabilities.documentFormattingProvider)
                                            (vim.api.nvim_create_autocmd [:BufWritePre]
                                                                         {:buffer event.buf
                                                                          :callback (fn [event]
                                                                                      (vim.lsp.buf.format {:async false}))
                                                                          :group (vim.api.nvim_create_augroup :lsp_buf_autoformat
                                                                                                              {:clear true})}
                                                                         ; (vim.api.nvim_exec
                                                                         ;   "augroup lsp_buf_autoformat
                                                                         ;   autocmd! * <buffer>
                                                                         ;   autocmd BufWritePre <buffer> silent! lua vim.lsp.buf.format({async = false})
                                                                         ;   augroup END" false)
                                                                         )))
                              :group (vim.api.nvim_create_augroup :kickstart-lsp-attach
                                                                  {:clear true})})

(vim.api.nvim_create_autocmd :LspDetach
                             {:callback (fn [event]
                                          (vim.lsp.buf.clear_references)
                                          (local client
                                                 (vim.lsp.get_client_by_id event.data.client_id))
                                          (when (and client
                                                     client.server_capabilities.documentHighlightProvider)
                                          (vim.api.nvim_clear_autocmds {:buffer event.buf
                                                                        :group :kickstart-lsp-highlight})))
                              :group (vim.api.nvim_create_augroup :kickstart-lsp-detach
                                                                  {:clear true})})

; setup different lsp configs
(local lspconfig (require :lspconfig))

; start lexical config
; this for some reason uses default_config that can't be retro-fit above I think

(local configs (require :lspconfig.configs))
(local lexical-config {:cmd [:/Users/ajayvigneshk/personal/projects/lexical/_build/dev/package/lexical/bin/start_lexical.sh]
                       :filetypes [:elixir :eelixir :heex]
                       :settings {}})
(when (not configs.lexical)
  (set configs.lexical
       {:default_config {:cmd lexical-config.cmd
                         :filetypes lexical-config.filetypes
                         :root_dir (fn [fname]
                                     (or ((lspconfig.util.root_pattern :mix.exs
                                                                       :.git) fname)
                                         (vim.loop.os_homedir)))
                         :settings lexical-config.settings}}))
(lspconfig.lexical.setup {})

(local lsp-config-setup
      {
      ;  :elixirls {:cmd [(.. (vim.fn.expand :$HOME)
      ;                        :/personal/projects/elixir-ls/release/language_server.sh)]
      ;              ; :cmd  [(.. (vim.fn.stdpath "data") :/lsp/elixir-ls/language_server.sh)]
      ;              :settings {:elixirLS {:dialyzerEnabled false
      ;                                    ; :suggestSpecs true
      ;                                    :signatureAfterComplete true
      ;                                    :enableTestLenses true}}}
        :lexical configs.lexical
        :gopls {}
        :texlab {:cmd [:texlab]}})

(local autocomplete-cmp (require :autocomplete-cmp))
(each [server-name server-config (pairs lsp-config-setup)]
  ((. lspconfig server-name :setup) ((. autocomplete-cmp
                                        :update-lspserver-config) server-config)))
