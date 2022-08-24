(local cmp (require :cmp))
(cmp.setup 
  {
   ; Experimenting with disabling autocompletion due to broken undo history (nvim issue)
   ; :view {:entries :custom}
   ; :completion {:autocomplete false}
   :snippet {:expand (fn [args] 
                       ((. (require :luasnip) :lsp_expand) args.body))}
   :mapping (cmp.mapping.preset.insert {:<C-b> (cmp.mapping.scroll_docs (- 4))
                                        :<C-f> (cmp.mapping.scroll_docs 4)
                                        :<C-Space> (cmp.mapping.complete)
                                        :<C-e> (cmp.mapping.abort)
                                        :<C-y> (cmp.mapping.confirm {:select true})})
   ; not sure if keyword_length works
   :sources [{:name :nvim_lsp} {:name :luasnip} {:name :buffer
                                                 :option {:keyword_length 5}} {:name :vim-dadbod-completion}]
   })
