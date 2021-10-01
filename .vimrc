filetype off


"set runtime path to include vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" " Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.vim/plugged')
"Plugins 
"Plug 'fatih/vim-go'
"Plug 'rust-lang/rust.vim'
"Plug 'racer-rust/vim-racer'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-markdown'
Plug 'ruanyl/vim-gh-line'
Plug 'Townk/vim-autoclose'
Plug 'Raimondi/delimitMate'
Plug 'lervag/vim-latex'
"Plug 'nsf/gocode', {'rtp': 'vim/'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ianks/vim-tsx' "syntax highlighting for tsx 
Plug 'leafgarland/typescript-vim' "syntax highlighting for .ts
Plug 'eslint/eslint'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'rafi/awesome-vim-colorschemes'
call plug#end()

"colorscheme solarized8
autocmd vimenter * ++nested colorscheme solarized8_flat

"Colorscheme configuration
""" nord config 
"let g:nord_bold_vertical_split_line = 1
"let g:nord_uniform_diff_background = 1
"let g:nord_italic = 1
"let g:nord_bold = 0 
"let g:nord_underline = 1

""" sonokai config
"let g:sonokai_diagnostic_line_highlight = 1
"let g:sonokai_diagnostic_text_highlight = 1
"let g:sonokai_diagnostic_virtual_text = 'colored'
"let g:sonokai_better_performance = 1
"let g:sonokai_style = 'shusia'
"

let g:go_gopls_enabled = 0
let g:go_fmt_command = 'goimports'
let g:rehash256 = 1 
"let g:ycm_autoclose_preview_window_after_completion = 1 
"let g:ycm_auto_trigger = 1
" use dark background for solarized/ airline theme 
let g:airline_theme='solarized_flood'
" let g:airline_theme='one'

filetype plugin indent on
syntax on 
" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark
set number
set relativenumber
set nocp
"Next two lines re-enables backspacing after above line disables
"set backspace=2
set backspace=indent,eol,start
set noswapfile
set nobackup
set nowritebackup 
set termguicolors
set noerrorbells

set autowrite "automatically save before :next or :make
set autoread "automatically re-read changed files without asking my permission.

set nohlsearch "turn off annoying search
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set ignorecase " ignore case while searching
set smartcase "but if I search for patterns with capital letters repect the case

" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

set ruler
set pastetoggle=<F2>
set wildmenu
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set tabstop=2
set shiftwidth=2 
set showmatch
set showcmd
set autoindent
set smartindent
set expandtab

au FocusLost * :wa   "Set vim to save file when focus is lost.
" my key bindings
map <C-n> :NERDTreeToggle<CR>
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^
nmap <space> zz
nmap n nzz
nmap N Nzz
"new way to get into normal mode 
imap fd <Esc>  
noremap ; :

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set history=50		" keep 50 lines of command line history

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

"Configuring fzf
"let g:fzf_history_dir = '~/.local/share/fzf-history'
"let g:fzf_command_prefix = 'Fzf'


" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
"if &t_Co > 2 || has("gui_running")
" syntax on
"  set hlsearch
" endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  "filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif


  " Strip trailing white space from all the following file types.
  autocmd FileType markdown,md,c,cpp,java,php,go,sh,py autocmd BufWritePre <buffer> %s/\s\+$//e
  "Typescript setup 
  autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")



" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"coc-go command customization.
autocmd FileType go nmap gtj :CocCommand go.tags.add json<cr>
autocmd FileType go nmap gty :CocCommand go.tags.add yaml<cr>
autocmd FileType go nmap gtx :CocCommand go.tags.clear<cr>

" Use U to show documentation in preview window.
nnoremap <silent> U :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
if has("autocmd")
  autocmd CursorHold * silent call CocActionAsync('highlight')
  autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
endif 

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"--------------------------------
" fzf customization
" ---------------------------------

nnoremap <silent> <leader>o :Files<CR>
nnoremap <silent> <leader>O :FZF!<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <Leader>t  :Tags<CR>
nnoremap <c-f>  :Rg<CR>

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" Open files in horizontal split
nnoremap <silent> <Leader>s :call fzf#run({
\   'down': '40%',
\   'sink': 'botright split' })<CR>

" Open files in vertical horizontal split
nnoremap <silent> <Leader>v :call fzf#run({
\   'right': winwidth('.') / 2,
\   'sink':  'vertical botright split' })<CR>


" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --colors "path:fg:190,220,255" --colors "line:fg:128,128,128" --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({ 'options': '--color hl:123,hl+:222' }), <bang>0)


""" Configure fugitive 
nnoremap gs :Gstatus
""" End fugitive


"""" Rust Settings 
"let g:racer_experimental_completer = 1
"let g:racer_insert_paren = 1
"set hidden
"augroup Racer
"    autocmd!
"    autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
"    autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
"    autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
"    autocmd FileType rust nmap <buffer> gt         <Plug>(rust-def-tab)
"    autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
"    autocmd FileType rust nmap <buffer> <leader>gD <Plug>(rust-doc-tab)
"augroup END

"""""" Typescript settings 

let g:typescript_indent_disable = 1 "turn of automatic indenter for chained calls" 

"make error appear in quickfix window"
autocmd QuickFixCmdPost [^l]* nested cwindow 
autocmd QuickFixCmdPost l* nested lwindow 
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript "format with prettier
