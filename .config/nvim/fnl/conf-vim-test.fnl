(vim.api.nvim_set_var "test#strategy" :dispatch)
(vim.api.nvim_set_keymap :n :<Leader>tn ":wa | TestNearest<CR>" {:noremap true
                                                                         :silent true})
(vim.api.nvim_set_keymap :n :<Leader>tf ":wa | TestFile<CR>" {:noremap true
                                                                      :silent true})
(vim.api.nvim_set_keymap :n :<Leader>ts ":wa | TestSuite<CR>" {:noremap true
                                                                       :silent true})
(vim.api.nvim_set_keymap :n :<Leader>tv ":wa | TestVisit<CR>" {:noremap true
                                                                       :silent true})
(vim.api.nvim_set_keymap :n :<Leader>tl ":wa | TestLast<CR>" {:noremap true
                                                                      :silent true})
