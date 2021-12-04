(local ts-config-setup (. (require :nvim-treesitter.configs) :setup))
(ts-config-setup {:highlight {:enable false}
                  :incremental_selection 
                  {:enable true
                   :keymaps {:init_selection :gnn
                             :node_incremental :grn
                             :scope_incremental :grc
                             :node_decremental :grm}}
                  :indent {:enable true}})
(ts-config-setup {:textobjects 
                  {:select 
                   {:enable true
                    :keymaps {:af "@function.outer"
                              :if "@function.inner"
                              :ac "@class.outer"
                              :ic "@class.inner"
                              :iF {:python "(function_definition) @function"
                                   :cpp "(function_definition) @function"
                                   :c "(function_definition) @function"
                                   :java "(method_declaration) @function"}}}}})
(ts-config-setup {:textobjects 
                  {:swap 
                   {:enable true
                    :swap_next {:<leader>a "@parameter.inner"}
                    :swap_previous {:<leader>A "@parameter.inner"}}}})
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
