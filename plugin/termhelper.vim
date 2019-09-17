let $TERMHELPER_SCRIPTS_DIR = expand('<sfile>:p:h:h') . '/scripts'

function! Tapi_TermHelper(bufnum, arglist) abort
  call termhelper#Run(a:arglist)
endfunction
