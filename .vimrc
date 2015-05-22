" required by vundle
set nocompatible

" toggle filetype to fix exit code.
filetype on
filetype off

"""""""""""""""
" START PLUGINS

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Powerline
let powerline_subpath = "/lib/python3.4/site-packages/powerline/bindings/vim/"
let powerline_rtp = substitute(system("brew --prefix"), "\n", "", "") . powerline_subpath
let &rtp = &rtp . "," . powerline_rtp

" Utilities
Plugin 'kana/vim-operator-user'

" Startup / session helper
Plugin 'mhinz/vim-startify'

" Color scheme
Plugin 'altercation/vim-colors-solarized.git'

" git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Completion
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'scrooloose/syntastic'

" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Motions
Plugin 'Keithbsmiley/investigate.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tomtom/tcomment_vim'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sleuth'
Plugin 'matchit.zip'
Plugin 'terryma/vim-multiple-cursors'

" file search / opening
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'JazzCore/ctrlp-cmatcher'
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/gundo.vim'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'chrisbra/NrrwRgn'
Plugin 'majutsushi/tagbar'
Plugin 'rking/ag.vim'

" C / C++ / Objc
Plugin 'rhysd/vim-clang-format'

" Objc
Plugin 'b4winckler/vim-objc'

" HTML
Plugin 'mattn/emmet-vim'

" haskell
Plugin 'bitc/vim-hdevtools'
Plugin 'dag/vim2hs'
Plugin 'bitc/lushtags'
Plugin 'enomsg/vim-haskellConcealPlus'

" clojure
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-fireplace' " Remember to set up cider/cider-nrepl in lein
Plugin 'tpope/vim-leiningen'
Plugin 'guns/vim-clojure-highlight'

" Protobuf
Plugin 'jdevera/vim-protobuf-syntax'

" required for vundle
call vundle#end()
filetype plugin indent on

"""""""""""""""""""
" PERSONAL SETTINGS

"""""""""""""
" KEYBINDINGS

inoremap <C-f> <Esc>
let mapleader=','
map <Space> <Leader>

" tab navigatin
noremap <C-t><C-t> :tabnew<CR>
noremap <C-t>j :tabnext<CR>
noremap <C-t>k :tabprevious<CR>
noremap <C-t>q :tabclose<CR>

" Easymotion bindings
nmap s <Plug>(easymotion-s2)
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)
set nohlsearch " EasyMotion search has better highlighting

" Configure YCM to play nice with Ultisnips
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'

" Submenus
noremap <Leader>/ :TComment<CR>
noremap <Leader>d :call investigate#Investigate()<CR>
noremap <Leader>f :NERDTreeToggle<CR>
noremap <Leader>o :TagbarToggle<CR>
noremap <Leader>u :GundoToggle<CR>
noremap <Leader>a :Ag<Space>
noremap <Leader>c :copen<CR>

" fireplace
noremap <Leader>e :Eval<CR>
noremap <Leader>E :%Eval<CR>

" plugin binding ref:
" vim-multiple-cursors - <C-n>
" buffergator - <Leader>b on buffers, <Leader>t on tabs
" NrrwRgn - :NR or <Leader>nr in visual mode
" ag.vim - :Ag
" surround - ds{remove}, cs{remove}{replace}, ys{motion}{add}, vS
" 	valid targets include (/"/etc, t (XML tags), w/W/s/p
" 	(word,sentence,paragraph)
" vim-sexp-regular-ppl - word motions -> element. >/< + f move form, e move
" 	elem, )/( to slurp/barf, I to insert at start/end of form. dsf delete
" 	surroundings of form, cse+paren/brace/bracket to surround element in
" 	that.
" emmet - <C-y>, to expand.

""""""""""""
" APPEARANCE

"Change cursor shape on insert / normal.
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Colorscheme
syntax enable
set background=light
let g:solarized_termcolors=16
set t_Co=256
colorscheme solarized

"""""""""
" GENERAL

set viminfo='50,<1000,:100,n~/.vim/viminfo
set history=50
set switchbuf=useopen,usetab,split

set backspace=indent,eol,start
set clipboard=unnamed

set ignorecase

set smarttab
set expandtab
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=0
set breakindent

set number
set relativenumber
set ruler
set showcmd

set foldenable
set foldmethod=syntax
set foldlevelstart=99
let g:xml_syntax_folding=1

set mouse=a

set ssop-=options
set ssop-=folds

"""""""""""""""
" PLUGIN CONFIG

"""""""""""
" Powerline
let g:Powerline_symbols = 'unicode'
set laststatus=2 "Keeps powerline on screen
set noshowmode "Get rid of default vim mode display
set encoding=utf-8

"""""""""""
" UltiSnips
let g:UltiSnipsSnippetDirectories=['~/.vim/bundle/vim-snippets/UltiSnips']

""""""""
" Ctrl-p
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_match_func = {'match' : 'matcher#cmatch'}
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ --ignore .git5_specs
      \ --ignore review
      \ -g ""'

"""""""
" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"""""""""
" Haskell
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>
au FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:syntastic_haskell_checkers = ['hdevtools', 'hlint']

""""""""""""""
" AUTOCOMMANDS

augroup vimrcEx
  au!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif

augroup END


" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
