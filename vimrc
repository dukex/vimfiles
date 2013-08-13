"necessary on some Linux distros for pathogen to properly load bundles
filetype on
filetype off

" load pathogen managed plugins
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
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
"
set history=1000                "store lots of :cmdline history
set showmode                    "show current mode down the bottom
set number                      "add line numbers
set showbreak=
set wrap linebreak nolist
"add some line space for easy reading
set linespace=4
"disable visual bell
set visualbell t_vb=
" statusline
set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P
set laststatus=2

" use comma as <Leader> key instead of backslash
let mapleader=","
"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
"set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
"tell the term has 256 colors
set t_Co=256
" GUI
set guifont=Menlo\ for\ Powerline:h17
set background=dark
colorscheme molokai
set guitablabel=%M%t
set guioptions-=T "turn off needless toolbar on gvim/mvim


" Mapping
nnoremap <leader>b :!bundle<CR>
nmap <C-s> :w<CR>
nmap <Tab> gt
nmap <S-Tab> gT

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

autocmd FileType python set sts=4 sw=4

" Libs
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-fugitive'
Bundle 'plasticboy/vim-markdown'
Bundle 'bling/vim-airline'
Bundle 'kien/ctrlp.vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'rking/ag.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'mattn/emmet-vim'
Bundle 'scrooloose/syntastic'
Bundle 'nono/vim-handlebars'
Bundle 'nelstrom/vim-markdown-folding'
Bundle 'jacekd/vim-iawriter'
Bundle 'laktek/distraction-free-writing-vim'

filetype plugin indent on       " load file type plugins + indentation

"map to ControlP TextMate style finder
let g:ctrlp_map = '<c-t>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
set runtimepath^=~/.vim/bundle/ctrlp.vim
nnoremap <leader>t :CtrlP<CR>

"snipmate setup
source ~/.vim/snippets/support_functions.vim
function! s:SetupSnippets()
  try
    call ExtractSnips("~/.vim/bundle/snipmate/snippets/html", "eruby")
    call ExtractSnips("~/.vim/bundle/snipmate/snippets/html", "xhtml")
    call ExtractSnips("~/.vim/bundle/snipmate/snippets/html", "handlebars")
  catch
  endtry
endfunction
autocmd vimenter * call s:SetupSnippets()

let g:ragtag_global_maps = 1
let g:neocomplcache_enable_at_startup = 1
let g:airline_powerline_fonts = 1
let g:syntastic_ruby_exec = '~/.rbenv/shims/ruby'
let g:syntastic_enable_signs=1


function! DistractionFreeWriting()
  colorscheme iawriter
  set background=light
  set lines=40 columns=100           " size of the editable area
  set fuoptions=background:#00f5f6f6 " macvim specific setting for editor's background color
  set guioptions-=r                  " remove right scrollbar
  set laststatus=0                   " don't show status line
  set noruler                        " don't show ruler
  set nonumber                       " don't show number
  set fullscreen                     " go to fullscreen editing mode
  set linebreak                      " break the lines on words
endfunction
au BufNewFile,BufRead *.{md,mdown,mkd,mkdn,markdown,mdwn} call DistractionFreeWriting()
