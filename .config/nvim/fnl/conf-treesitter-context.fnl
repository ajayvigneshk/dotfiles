((. (require :treesitter-context) :setup) {:enable true
                                           :line_numbers true
                                           :max_lines 0
                                           :min_window_height 0
                                           :mode :cursor
                                           :multiline_threshold 20
                                           :on_attach (fn [bufnr]
                                                        (not= (. (. vim.bo
                                                                    bufnr)
                                                                 :filetype)
                                                              :vim))
                                           :separator nil
                                           :trim_scope :outer
                                           :zindex 20})
