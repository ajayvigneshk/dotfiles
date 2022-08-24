(vim.api.nvim_set_option :pumheight 8)
(vim.api.nvim_set_option :wildmode "lastused:full")
; Not respected by wildmenu
(vim.api.nvim_set_option :completeopt "menu,preview,noselect")
;mappings
; switch buffers
(vim.api.nvim_set_keymap :n :<leader>b ":b " {:noremap true})
;find
(vim.api.nvim_set_keymap :n :<leader>fd ":find " {:noremap true})
;set path based on git (only when within git directory)
(vim.api.nvim_create_augroup "GitDir" {:clear true})
(vim.api.nvim_create_autocmd 
  ["VimEnter" "DirChanged"] 
  {:callback (fn setSanePath [] (vim.api.nvim_command "call git#SetSanePath()"))
   :group "GitDir"}
  )
