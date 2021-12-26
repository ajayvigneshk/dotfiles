(vim.api.nvim_set_option :pumheight 8)
(vim.api.nvim_set_option :wildmode "lastused:full")
; Not respected by wildmenu
(vim.api.nvim_set_option :completeopt "menu,preview,noselect")
;mapping for switching buffers
(vim.api.nvim_set_keymap :n :<leader>b ":b " {:noremap true})
