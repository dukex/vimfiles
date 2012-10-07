"necessary on some Linux distros for pathogen to properly load bundles
filetype on
filetype off

" load pathogen managed plugins
call pathogen#infect()

set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" Off automatic backup
set nobackup
set nowritebackup
set noswapfile

set history=1000                "store lots of :cmdline history

set showmode                    "show current mode down the bottom

set number                      "add line numbers
set showbreak=
set wrap linebreak nolist

"add some line space for easy reading
set linespace=4

"disable visual bell
set visualbell t_vb=

"statusline setup
set statusline=%f       "tail of the filename

set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2

"turn off needless toolbar on gvim/mvim
set guioptions-=T

" use comma as <Leader> key instead of backslash
let mapleader=","


"tell the term has 256 colors
set t_Co=256
set guifont=Monaco:h14

syntax enable
" set background=dark
" colorscheme molokai
set background=light
colorscheme solarized

set guitablabel=%M%t

"map to CommandT TextMate style finder

let g:ctrlp_map = '<c-t>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX

nnoremap <leader>t :CtrlP<CR>



let g:sparkupExecuteMapping = '<c-s>'



"mark syntax errors with :signs
let g:syntastic_enable_signs=1

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()


"key mapping for saving file
nmap <C-s> :w<CR>

"key mapping for tab navigation
nmap <Tab> gt
nmap <S-Tab> gT

"snipmate setup
source ~/.vim/snippets/support_functions.vim
autocmd vimenter * call s:SetupSnippets()

function! s:SetupSnippets()
  "if filereadable("./config/environment.rb")
  "  try
  "    call ExtractSnips("~/.vim/snippets/ruby-rails", "ruby")
  "    call  ExtractSnips("~/.vim/snippets/eruby-rails", "eruby")
  "  catch
  "    call ExtractSnips("~/vimfiles/snippets/ruby-rails", "ruby")
  "    call ExtractSnips("~/vimfiles/snippets/eruby-rails","eruby")
  "  endtry
  "endif

  try
    call ExtractSnips("~/.vim/bundle/snipmate/snippets/html", "eruby")
    call ExtractSnips("~/.vim/bundle/snipmate/snippets/html", "xhtml")
  catch
    call ExtractSnips("~/vimfiles/snippets/html", "eruby")
    call ExtractSnips("~/vimfiles/snippets/html", "xhtml")
  endtry
endfunction

autocmd FileType python set sts=4 sw=4

set runtimepath^=~/.vim/bundle/ctrlp.vim

