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


"Command-T configuration
let g:CommandTMaxHeight=10
let g:CommandTMatchWindowAtTop=1

if has("gui_running")
    "tell the term has 256 colors
    set t_Co=256

    set background=dark
    colorscheme solarized
    set guitablabel=%M%t
    set lines=40
    set columns=115

    if has("gui_gnome")
        set term=gnome-256color
        set guifont=Monospace\ Bold\ 12
    endif

    if has("gui_mac") || has("gui_macvim")
        set guifont=Monaco:h13
        let g:solarized_termcolors=256
        " key binding for Command-T to behave properly
        " uncomment to replace the Mac Command-T key to Command-T plugin
        "macmenu &File.New\ Tab key=<nop>
        map <D-t> :CommandT<CR>
        " make Mac's Option key behave as the Meta key
    endif
endif

"map to CommandT TextMate style finder
nnoremap <leader>t :CommandT<CR>

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