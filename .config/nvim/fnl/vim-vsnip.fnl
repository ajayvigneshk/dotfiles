(fn replace_term_codes [str] 
                    (vim.api.nvim_replace_termcodes str true true true))
; can't use require/pcall as it's a vimscript not lua plugin
; todo possibly autocmd (and not pcall, even on existing ones) for the plugins can be dynamically loaded
(let [f (fn [] 
          (do 
            (vim.api.nvim_set_var 
              "vsnip_snippet_dir" (.. (os.getenv "HOME") "/.config/vsnip/"))
            ; (print (vim.inspect (vim.api.nvim_get_var "vsnip_snippet_dir")))
            ))]
  (f))
