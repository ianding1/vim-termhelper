function! termhelper#Run(arglist) abort
  if a:arglist[0] ==# 'drop'
    call call(function('s:Drop'), a:arglist[1:])
  elseif a:arglist[0] ==# 'new'
    call call(function('s:New'), a:arglist[1:])
  elseif a:arglist[0] ==# 'vnew'
    call call(function('s:Vnew'), a:arglist[1:])
  elseif a:arglist[0] ==# 'preview'
    call call(function('s:Preview'), a:arglist[1:])
  elseif a:arglist[0] ==# 'other'
    call call(function('s:Other'), a:arglist[1:])
  else
    " Ignore
  endif
endfunction

function! s:EscapeArg(arg) abort
  return substitute(a:arg, ' ', '\ ', 'g')
endfunction

function! s:Drop(fname) abort
  exec 'drop ' . s:EscapeArg(a:fname)
endfunction

function! s:New(fname) abort
  exec 'new ' . s:EscapeArg(a:fname)
endfunction

function! s:Vnew(fname) abort
  exec 'vnew ' . s:EscapeArg(a:fname)
endfunction

function! s:Preview(fname) abort
  for winnum in range(1, winnr('$'))
    if getwinvar(winnum, '&previewwindow')
      let saved_winnum = winnr()
      exec winnum . 'wincmd w'
      exec 'edit ' . s:EscapeArg(a:fname)
      exec saved_winnum . 'wincmd w'
      return
    endif
  endfor

  let saved_winnum = winnr()
  exec 'vnew ' . s:EscapeArg(a:fname)
  setlocal previewwindow
  exec saved_winnum . 'wincmd w'
endfunction

function! s:Other(fname) abort
  if winnr('$') == 1
    echo 'Only one window'
    return
  endif

  wincmd w
  exec 'edit ' . s:EscapeArg(a:fname)
endfunction
