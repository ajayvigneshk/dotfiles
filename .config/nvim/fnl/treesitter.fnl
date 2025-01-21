(local ts-config-setup (. (require :nvim-treesitter.configs) :setup))
(ts-config-setup {:highlight {:enable true}
                  :incremental_selection 
                  {:enable true
                   :additional_vim_regex_highlighting false
                   :keymaps {:init_selection :gnn
                             :node_incremental :grn
                             :scope_incremental :grc
                             :node_decremental :grm}}
                  :indent {:enable false}})
(ts-config-setup {:textobjects 
                  {:select 
                   {:enable true
                    :lookahead true
                    :keymaps {:af "@function.outer"
                              :if "@function.inner"
                              :ac "@class.outer"
                              :ic "@class.inner"
                              :aa "@parameter.outer"
                              :ia "@parameter.inner"}}}})
; (ts-config-setup {:textobjects 
;                   {:swap 
;                    {:enable true
;                     :swap_next {:<leader>a "@parameter.inner"}
;                     :swap_previous {:<leader>A "@parameter.inner"}}}})
(ts-config-setup {:textobjects 
                  {:move 
                   {:enable true
                    :set_jumps true
                    :goto_next_start {"]m" "@function.outer"
                                      "]]" "@class.outer"}
                    :goto_next_end {"]M" "@function.outer"
                                    "][" "@class.outer"}
                    :goto_previous_start {"[m" "@function.outer"
                                          "[[" "@class.outer"}
                    :goto_previous_end {"[M" "@function.outer"
                                        "[]" "@class.outer"}}}})
