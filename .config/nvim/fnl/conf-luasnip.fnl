(fn nvim_replace_termcodes [arg]
  (vim.api.nvim_replace_termcodes arg true true true))
(local cmp (require :cmp))
(local luasnip (require :luasnip))
(local ls luasnip)
(local s luasnip.snippet)
(local sn luasnip.snippet_node)
(local isn luasnip.indent_snippet_node)
(local t luasnip.text_node)
(local i luasnip.insert_node)
(local f luasnip.function_node)
(local c luasnip.choice_node)
(local d luasnip.dynamic_node)
(local r luasnip.restore_node)
(set _G.snip_expand
     (fn []
       (if (and luasnip (luasnip.expandable))
         (nvim_replace_termcodes :<Plug>luasnip-expand)
         (t :<C-y>))))
(set _G.snip_jump_next
     (fn []
       (if (and luasnip (luasnip.jumpable 1))
         (nvim_replace_termcodes :<Plug>luasnip-jump-next)
         (nvim_replace_termcodes :<Tab>))))
(set _G.snip_jump_prev
     (fn []
       (if (and luasnip (luasnip.jumpable -1))
         (nvim_replace_termcodes :<Plug>luasnip-jump-prev)
         (nvim_replace_termcodes :<S-Tab>))))
(vim.api.nvim_set_keymap :i :<C-y> "v:lua.snip_expand()" {:expr true})
(vim.api.nvim_set_keymap :s :<C-y> "v:lua.snip_expand()" {:expr true})
(vim.api.nvim_set_keymap :i :<Tab> "v:lua.snip_jump_next()" {:expr true})
(vim.api.nvim_set_keymap :s :<Tab> "v:lua.snip_jump_next()" {:expr true})
(vim.api.nvim_set_keymap :i :<S-Tab> "v:lua.snip_jump_prev()" {:expr true})
(vim.api.nvim_set_keymap :s :<S-Tab> "v:lua.snip_jump_prev()" {:expr true})
; (vim.api.nvim_set_keymap :i :<C-n> :<Plug>luasnip-next-choice {})
; (vim.api.nvim_set_keymap :s :<C-n> :<Plug>luasnip-next-choice {})
; (vim.api.nvim_set_keymap :i :<C-p> :<Plug>luasnip-prev-choice {})
; (vim.api.nvim_set_keymap :s :<C-p> :<Plug>luasnip-prev-choice {})
(luasnip.add_snippets :all [(s :ternary
                               [(i 1 :cond)
                                (t " ? ")
                                (i 2 :then)
                                (t " : ")
                                (i 3 :else)])])
(luasnip.add_snippets :all [(s :trig 
                               (c 1 
                                  [(t "Ugh boring, a text node")
                                   (i nil "At least I can edit something now...")
                                   (f (fn [args]
                                        "Still only counts as text!!") {})
                                   ]))])
