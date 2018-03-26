
function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? 'OK' : printf(
        \ '%dW %dE',
        \ l:all_non_errors,
        \ l:all_errors
        \)
endfunction

set statusline=%{LinterStatus()} " Left

set statusline+=%=

" '(L{line},C{column})'
set statusline+=(L%l,C%c) " Middle

set statusline+=%=

" relative filename, filetype, indicators (modified, read-only, preview-only)
set statusline+=%f\ %y%m%r%w " Right