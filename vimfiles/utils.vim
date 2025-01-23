function! SourceFile(filepath)
    let l:expanded_path = expand(a:filepath)
    if filereadable(l:expanded_path)
        execute 'source' l:expanded_path
    else
        echohl WarningMsg | echom "File does not exist: " . l:expanded_path | echohl None
    endif
endfunction

if !exists('*MKDir')
  function MKDir(path)
    silent execute '!mkdir '.a:path.' > /dev/null 2>&1'
  endfunction
endif

