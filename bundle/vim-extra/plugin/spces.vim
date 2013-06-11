function! RunRSpec()
  let file = substitute(bufname("%"), "app", "spec", "")
  let file = substitute(file, ".rb$", "_spec.rb", "")
  exec ':!bundle exec rspec '. file
endfunction
