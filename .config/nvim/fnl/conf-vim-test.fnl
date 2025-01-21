(vim.api.nvim_set_var "test#strategy" :toggleterm)
(vim.api.nvim_set_keymap :n :<Leader>tn ":TestNearest<CR>" {:noremap true
                                                           :silent true})
(vim.api.nvim_set_keymap :n :<Leader>tf ":TestFile<CR>" {:noremap true
                                                        :silent true})
(vim.api.nvim_set_keymap :n :<Leader>ts ":TestSuite<CR>" {:noremap true
                                                         :silent true})
(vim.api.nvim_set_keymap :n :<Leader>tv ":TestVisit<CR>" {:noremap true
                                                         :silent true})
(vim.api.nvim_set_keymap :n :<Leader>tl ":TestLast<CR>" {:noremap true
                                                        :silent true})
(vim.api.nvim_set_keymap :n :<Leader>tr ":ExUnit --failed<CR>" {:noremap true
                                                               :silent true})
