(fn t [arg]
  (vim.api.nvim_replace_termcodes arg true true true))
(local cmp (require :cmp))
(local luasnip (require :luasnip))
(set _G.snip_expand
     (fn []
       (if (and luasnip (luasnip.expandable)) 
         (t :<Plug>luasnip-expand) 
         (t :<C-y>))))
(set _G.snip_jump_next
     (fn []
       (if (and luasnip (luasnip.jumpable 1)) 
         (t :<Plug>luasnip-jump-next) 
         (t :<Tab>))))
(set _G.snip_jump_prev
     (fn []
       (if (and luasnip (luasnip.jumpable -1)) 
         (t :<Plug>luasnip-jump-prev) 
         (t :<S-Tab>))))
(vim.api.nvim_set_keymap :i :<C-y> "v:lua.snip_expand()" {:expr true})
(vim.api.nvim_set_keymap :s :<C-y> "v:lua.snip_expand()" {:expr true})
(vim.api.nvim_set_keymap :i :<Tab> "v:lua.snip_jump_next()" {:expr true})
(vim.api.nvim_set_keymap :s :<Tab> "v:lua.snip_jump_next()" {:expr true})
(vim.api.nvim_set_keymap :i :<S-Tab> "v:lua.snip_jump_prev()" {:expr true})
(vim.api.nvim_set_keymap :s :<S-Tab> "v:lua.snip_jump_prev()" {:expr true})
