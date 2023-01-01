; Very WIP, very untested 
; general neotest setup
; vim.deepcopy won't help,since the local variable is retained as a part of closure
; (local fennel (require :fennel))
; (fn get-neotest-elixir []
;   ; (let [required-value (require :neotest-elixir)]
;   ; (let [required-value (dofile "/Users/ajayvigneshk/personal/projects/vim_plugins/neotest-elixir-worktree/embedded-json-encoder/lua/neotest-elixir/init.lua")]
;   (let [required-value (dofile (.. (vim.fn.stdpath "data") "/site/pack/packer/start/neotest-elixir/lua/neotest-elixir/init.lua"))]
;     required-value
;     )
;   )

; (local common ((get-neotest-elixir) {:extra_formatters ["ExUnit.CLIFormatter"]}))
; (print "fnl" "common" common)
; (print (fennel.view common))
; (print (fennel.view (common.extra_formatters)))
; (local tiger ((get-neotest-elixir) {:extra_formatters ["Tiger.CLIFormatter"]}))
; (print "fnl" "tiger" tiger)
; (print (fennel.view (tiger.extra_formatters)))
; ; (print (fennel.view tiger))
; (print "fnl" "common after tiger")
; (print "fnl" "common" common)
; (print (fennel.view (common.extra_formatters)))
; ; (print (fennel.view common))
; (print (= tiger common))


; ((. (require :neotest) :setup) {:adapters [common]})

; ; setup neotest for tiger
; ((. (require :neotest) :setup_project) "~/remote/code/tiger" 
;  {:adapters [tiger]
;   ; marked due to performance issues on large repos
;   :discovery {:concurrent false}
;   })


(local neotest (require :neotest))
(neotest.setup {:adapters [(require :neotest-elixir)]
                :icons {:running_animated ["⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏"]
                        }
                :discovery {:concurent  1}})
(vim.api.nvim_create_user_command :NeotestSummary neotest.summary.toggle {})

(vim.api.nvim_create_user_command :NeotestSuite (fn [params] 
                                                  (neotest.run.run (vim.fn.getcwd))
                                                  ) {})
(vim.api.nvim_create_user_command :NeotestFile (fn [params]
                                                 (neotest.run.run (vim.fn.expand "%"))
                                                 ) {})
(vim.api.nvim_create_user_command :NeotestNearest neotest.run.run {})
(vim.api.nvim_create_user_command :NeotestLast neotest.run.run_last {})
(vim.api.nvim_create_user_command :NeotestAttach neotest.run.attach {})
(vim.api.nvim_create_user_command :NeotestOutput neotest.output.open {})

; (vim.api.nvim_set_keymap :n :<Leader>tn ":wa | NeotestNearest<CR>" {:noremap true :silent true})
; (vim.api.nvim_set_keymap :n :<Leader>tf ":wa | NeotestFile<CR>" {:noremap true :silent true})
; (vim.api.nvim_set_keymap :n :<Leader>ts ":wa | NeotestSuite<CR>" {:noremap true :silent true})
; (vim.api.nvim_set_keymap :n :<Leader>tl ":wa | NeotestLast<CR>" {:noremap true :silent true})
; (vim.api.nvim_set_keymap :n :<Leader>to ":wa | NeotestOutput<CR>" {:noremap true :silent true})
; (vim.api.nvim_set_keymap :n :<Leader>ta ":wa | NeotestAttach<CR>" {:noremap true :silent true})

; (vim.api.nvim_set_keymap :n :<Leader>tv ":wa | TestVisit<CR>" {:noremap true
;                                                                :silent true})
; (vim.api.nvim_set_keymap :n :<Leader>tr ":wa | ExUnit --failed<CR>" {:noremap true
;                                                                      :silent true})
