function! RunSpec()
  if executable('./script/test')
    :!./script/test %
  elseif executable('./b/rspec')
    :!./b/rspec %
  elseif executable('bundle')
    :!bundle exec ruby -I'lib:test' %
  endif
endfunction

function! RunSpecOnLine()
  if executable('./script/test')
    :!./script/test %:<C-r>=line('.')<CR><CR>
  elseif executable('./b/rspec')
    :!./b/rspec %:<C-r>=line('.')<CR><CR>
  endif
endfunction

