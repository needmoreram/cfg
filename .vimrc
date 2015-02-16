"
" $Id$
"

  set nocompatible

" Plugins
" Vundle
  filetype off
  set runtimepath+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  Plugin 'gmarik/Vundle.vim'
  Plugin 'tomasr/molokai'
  Plugin 'sjl/badwolf'
  Plugin 'morhetz/gruvbox'
  Plugin 'bling/vim-airline'
  Plugin 'oblitum/rainbow'
  Plugin 'majutsushi/tagbar'
" Plugin 'sjl/gundo.vim'
" Plugin 'tpope/vim-fugitive'

  call vundle#end()
  filetype plugin indent on

" Gruvbox
  if !has("gui_running")
    let g:gruvbox_italic=0
  endif

" Airline
  let g:airline_powerline_fonts = 1
  let g:airline_theme = "simple"
  let g:airline#extensions#tagbar#enabled = 1
  let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#show_buffers = 0
  let g:airline#extensions#tabline#buffer_min_count = 2
  let g:airline#extensions#tabline#buffer_min_count = 2

" Tagbar
  let g:tagbar_ctags_bin = "/usr/local/bin/ctags"
" let g:tagbar_autopreview = 1
  let g:tagbar_autoclose = 1
  let g:tagbar_autofocus = 1

  set background=dark   " set background type
  colorscheme gruvbox   " choose colorscheme
 
  syntax on             " enable syntax processing
" set number            " show line numbers
" set ruler             " show ruler
  set autoindent        " copy indentation from previous line
" set smartindent       " automatically add one level of idx when necessary
  set expandtab	        " tabs are spaces
  set tabstop=4         " number of columns in a tab
  set softtabstop=4     " number of spaces in a tab
  set shiftwidth=4      " number of columns to shift by using < or >
  set cursorline        " highlight current line
" set showmatch         " highlight matching bracket

  set wildmenu          " visual auto-complete for command menu
  set showcmd           " show command in the status bar
  set showmode          " show mode in the status bar
" set lazyredraw        " redraw only when necessary
  set shortmess+=I      " hush startup message
  set scrolloff=5       " keep context while scrolling
  set laststatus=2      " 
" set modelines=1       " use modelines specified by file
  let mapleader=","     " leader is comma
  let g:mapleader = "," " leader is comma

  set hlsearch          " highlight search matches
  set incsearch         " search as characters are entered
  
  set splitbelow        " split below for hsplit
  set splitright        " split right for vsplit

  set tags=./tags;/     " search for tags in current dir, span outward
 
  set backspace=indent,eol,start

" Bindings

  command Q q           " Q = q
  command W w           " W = w
  command Wq wq         " Wq = wq
  command WW w !sudo tee % > /dev/null

  nnoremap gV `[v`]     " visually select last batch of insert
  noremap <C-d> :q<CR>  " use ctrl_d to quit

  noremap <C-J> <C-W><C-J>
  noremap <C-K> <C-W><C-K>
  noremap <C-L> <C-W><C-L>
  noremap <C-H> <C-W><C-H>
  noremap <C-\> :TagbarToggle<CR>

  augroup configgroup
      autocmd!
      autocmd VimEnter * highlight clear SignColumn
      autocmd FileType make setlocal noexpandtab
      autocmd FileType c,cpp,py,java call rainbow#load()
"     autocmd BufEnter Makefile setlocal noexpandtab
  augroup END

  function! ToggleNumber()
      if (&relativenumber == 1)
          set norelativenumber
          set number
      else
          set relativenumber
      endif
  endfunc
