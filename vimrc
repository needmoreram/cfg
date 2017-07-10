" " " " " " " " " " " " " " " " " " " "
" vimrc
"

  set nocompatible


  call plug#begin()

    Plug 'morhetz/gruvbox'
    Plug 'majutsushi/tagbar'

  call plug#end()


  set background=dark     " set background type
  let g:gruvbox_italic=1  " comments appear in italic form
  colorscheme gruvbox     " choose colorscheme
  syntax on               " enable syntax processing

  set tabstop=4           " num spaces a tab counts for
  set softtabstop=4       " num spaces when inserting tab
  set shiftwidth=4        " num columns to shift by
  set expandtab           " tabs are spaces
" set autoindent          " copy indentation from previous line
  filetype indent on      " language specific indentation

  set showcmd             " show last run command
  set wildmenu            " visual auto-complete for command menu
  set showmode            " show current mode in status bar
  set showmatch           " highlight match bracket
" set cursorline          " highlight current line
" set lazyredraw          " redraw only when needed

  set hlsearch            " highlight search matches
  set incsearch           " search as characters are entered

  let mapleader=","       " leader is comma
  let g:mapleader = ","   " global leader is comma

  set tags=./tags;/       " search for ctags in current dir, span outward

  noremap <C-d> :q<CR>    " remap ctrl-d to quit vim
  nnoremap Q <Nop>        " disable Q

  command Q q
  command W w
  command Wq wq
  command Wperm w !sudo tee % > /dev/null

  augroup auconfig
    " prevent auto-insertion of comment lines
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    " treat Makefile.in* as a regular Makefile
    autocmd BufNewFile,BufRead Makefile.in* set filetype=make
    " don't expand tabs to spaces in makefiles
    autocmd FileType make setlocal noexpandtab
  augroup END
