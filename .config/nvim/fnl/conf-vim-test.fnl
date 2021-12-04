(vim.api.nvim_set_var "test#strategy" :dispatch)
(vim.api.nvim_set_keymap :n :<Leader>tn ":up | TestNearest<CR>" {:noremap true
                                                                         :silent true})
(vim.api.nvim_set_keymap :n :<Leader>tf ":up | TestFile<CR>" {:noremap true
                                                                      :silent true})
(vim.api.nvim_set_keymap :n :<Leader>ts ":up | TestSuite<CR>" {:noremap true
                                                                       :silent true})
(vim.api.nvim_set_keymap :n :<Leader>tv ":up | TestVisit<CR>" {:noremap true
                                                                       :silent true})
(vim.api.nvim_set_keymap :n :<Leader>tl ":up | TestLast<CR>" {:noremap true
                                                                      :silent true})
