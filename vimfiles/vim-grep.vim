if executable('ag')
  set grepprg=ag\ --vimgrep\ --ignore\ tags
  set grepformat=%f:%l:%c:%m
elseif executable('rg')
  set grepprg=rg\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif
