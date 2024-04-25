(local cmp (require :cmp))
(cmp.setup 
  {
   ; Experimenting with disabling autocompletion due to broken undo history (nvim issue)
   ; :view {:entries :custom}
   ; :completion {:autocomplete false}
   :performance {:debounce 500
                 :max_view_entries 200}
   :snippet {:expand (fn [args] 
                       ((. (require :luasnip) :lsp_expand) args.body))}
   :mapping (cmp.mapping.preset.insert {:<C-b> (cmp.mapping.scroll_docs (- 4))
                                        :<C-f> (cmp.mapping.scroll_docs 4)
                                        :<C-Space> (cmp.mapping.complete)
                                        :<C-e> (cmp.mapping.abort)
                                        :<C-y> (cmp.mapping.confirm {:select true})
                                        :<C-x><C-s> (cmp.mapping.complete {:config {:sources [{:name :luasnip}]}})
                                        :<C-x><C-o> (cmp.mapping.complete {:config {:sources [{:name :buffer}]}})
                                        :<C-x><C-l> (cmp.mapping.complete {:config {:sources [{:name :nvim_lsp}]}})
                                        })
   ; not sure if keyword_length works
   :sources (cmp.config.sources [{:name :nvim_lsp}
                                 {:name :luasnip}
                                 {:name :buffer
                                  :option {
                                           :keyword_length 5
                                           :get_bufnrs (fn [] (vim.api.nvim_list_bufs))
                                           }}
                                 {:name :nvim_lsp_signature_help}
                                 {:name :vim-dadbod-completion}
                                 ])
   })
