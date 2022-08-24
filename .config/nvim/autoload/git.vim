" Source https://www.reddit.com/r/vim/comments/gbhvlo/what_am_i_missing_by_not_using_fzf/fpa2kys/
" Not doing this in lua since getting a command output in lua seems needlessly
" complicated(I could do vimscript in lua :shrug)
" For information about path ref https://gist.github.com/romainl/7e2b425a1706cd85f04a0bd8b3898805
function! git#SetSanePath() abort
    " Set a basic &path
    set path=.,,

    " Check if inside git repository and retrieve current branch
    let l:branch = system('git rev-parse --abbrev-ref HEAD 2>/dev/null')
    if l:branch == ''
        return
    endif

    " Retrieve list of tracked directories
    let l:tree_command = "git ls-tree -d --name-only " . l:branch
    let l:git_directories = systemlist(l:tree_command . ' 2>/dev/null')
    if empty(l:git_directories)
        return
    endif

    " Remove dot directories
    " let l:directories = filter(l:git_directories, { idx, val -> val !~ '^\.' })
    let l:directories = l:git_directories

    " Add recursive wildcard to each directory
    let l:final_directories = map(l:directories, { idx, val -> val . '/**' })

    " Add all directories to &path
    let &path .= join(l:final_directories, ',')
endfunction 
function! git#WithinGitDir() abort
    " Check if inside git repository and retrieve current branch
    let l:branch = system('git rev-parse --abbrev-ref HEAD 2>/dev/null')
    if l:branch != ''
        return 1
    endif
    " vimscript has implicit 0 return
endfunction
