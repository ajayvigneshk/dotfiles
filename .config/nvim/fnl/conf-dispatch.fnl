; nvim jobs are not single threaded. They seem to be forked as processes. The result collection part is still single threaded inside vim
(vim.api.nvim_set_var "dispatch_no_tmux_make" 1)
(vim.api.nvim_set_var "dispatch_no_tmux_start" 1)
; (vim.api.nvim_set_var "dispatch_no_job_make" 1)
; (vim.api.nvim_set_var "dispatch_no_job_start" 1)
