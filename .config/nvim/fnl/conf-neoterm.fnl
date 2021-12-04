(fn replace_term_codes [arg]
  (vim.api.nvim_replace_termcodes arg true true true))
; (vim.api.nvim_set_var "neoterm_autojump" 1)
(vim.api.nvim_set_var "neoterm_term_per_tab" 1)
(vim.api.nvim_set_var "neoterm_autoscroll" 1)
(vim.api.nvim_set_var "neoterm_default_mod" :botright)
; using a `y` prefix like vim unimpaired for toggle
(vim.api.nvim_set_keymap :n :ytt ":Ttoggle<CR>" {:noremap true :silent true})
; (vim.api.nvim_set_keymap "n" "<leader>tl" ":<c-u>exec v:count.'Tclear'<cr>" {:noremap true :silent true})
(vim.api.nvim_set_keymap :n :gx "<Plug>(neoterm-repl-send)" {:noremap false :silent true})
(vim.api.nvim_set_keymap :n :gxx "<Plug>(neoterm-repl-send-line)" {:noremap false :silent true})
