(local cmp (require :cmp))
(cmp.setup 
  {:snippet 
   {:expand (fn [args]
              ((. (require :luasnip) :lsp_expand) args.body))}
   :mapping {:<C-d> (cmp.mapping.scroll_docs (- 4))
             :<C-f> (cmp.mapping.scroll_docs 4)
             :<C-Space> (cmp.mapping.complete)
             :<C-e> (cmp.mapping.close)
             :<C-y> (cmp.mapping.confirm {:select true})}
   :sources [{:name :nvim_lsp} {:name :luasnip}]
   })
