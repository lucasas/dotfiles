" do not use vi compatibility mode. must come first because it changes other options.
set nocompatible

" show incomplete commands
set showcmd

" show invisibles
set list

" use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" show line numbers
set number

" don't break wrapped lines on words
set linebreak

" highlight 80 columns
set cc=80

" enable syntax highlighting
syntax on

" intuitive backspacing
set backspace=indent,eol,start

" EOL format
set fileformats=unix,mac,dos

" highlight cursor line
set cursorline

" highlight matches as you type
set incsearch 

" highlight matches
set hlsearch

" show 3 lines of context around the cursor
set scrolloff=3

" ignore case while searching except if there's an uppercase letter
set ignorecase smartcase

" indent settings
set shiftwidth=2 " number of spaces used for (auto)indent
set expandtab " use soft tabs (spaces)
set softtabstop=2 " size of soft tabs
set autoindent " auto indent lines
set smartindent " smart (language based) auto indent 

" keep 100 cmdline history
set history=100

" persistent undo
set undofile
set undodir=~/.vim/tmp

" backup options
set backup " turn on backup
set backupdir=~/.vim/backup " dir to save backup files
set directory=~/.vim/tmp " dir to keep all swap files

" show status line all the time
set laststatus=2

" enhanced command line completion
set wildmenu
" complete files like a shell
set wildmode=list:longest

"command-t ignore list
set wildignore=vendor/bundle/**,tmp/**,log/**,coverage/**,solr/data

" handle multiple buffers better
set hidden

" allow project specific vimrc
set exrc

" auto install plug.vim
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plug.vim setup
call plug#begin('~/.vim/plugged')

" vim bundles
Plug 'tomasr/molokai'
Plug 'antlypls/vim-colors-codeschool'
Plug 'tpope/vim-pathogen'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'mileszs/ack.vim'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Lokaltog/vim-easymotion'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'scrooloose/nerdcommenter'
Plug 'neomake/neomake'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'vim-scripts/matchit.zip'
Plug 'vim-scripts/YankRing.vim'
Plug 'vim-scripts/kwbdi.vim'
Plug 'vim-scripts/IndexedSearch'
Plug 'esneider/YUNOcommit.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'docker/docker', {'rtp': 'contrib/syntax/vim/'}
Plug 'sheerun/vim-polyglot'
Plug 'ludovicchabant/vim-gutentags'
Plug 'c-brenn/phoenix.vim'
Plug 'tpope/vim-projectionist' " required by phoenix.vim
Plug 'slashmili/alchemist.vim'
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'
Plug 'bhurlow/vim-parinfer'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'airblade/vim-gitgutter'
Plug 'thoughtbot/vim-rspec'
Plug 'valloric/youcompleteme', { 'do': './install.py' }
Plug 'rust-lang/rust.vim'
Plug 'tomasr/molokai'
Plug 'vim-ruby/vim-ruby'
Plug 'mileszs/ack.vim'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'Lokaltog/vim-easymotion'
Plug 'jnwhiteh/vim-golang'
Plug 'scrooloose/nerdcommenter'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'git://git.wincent.com/command-t.git'
Plug 'garbas/vim-snipmate'

" Initialize plugin system
" All of your Plugins must be added before the following line
call plug#end()

" enable file type detection
filetype plugin on

" enable filetype-based indentation
filetype indent on

" set color scheme
colorscheme codeschool

set guifont=Monaco:h24

" enable 256 colors in terminal
set t_Co=256

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme="luna"

" Useful status information at bottom of screen
" set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{GitBranchInfoString()}\ %=%-16(\ %l,%c-%v\ %)%P

" change leader key
let mapleader=","

" save keystrokes, so we don't need to press the Shift key
nnoremap ; :

" switch to last used buffer
nnoremap <leader>l :e#<CR>

" YankRing mapping
nnoremap <leader>y :YRShow<CR>

" YankRing configs
let g:yankring_history_dir = "~/.vim/tmp"

" clears the search register
nmap <silent> <leader>/ :nohlsearch<CR>

" navigate through buffers
nmap <silent> <leader>be :CommandTBuffer<CR>

" run CommandTFlush before opening CommandT
map <leader>t :CommandTFlush<cr>\|:CommandT<cr>

"Command-T mappings for rails
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>

" show tag list
nnoremap <leader>T :Tlist<CR>

" open rails routes file
map <leader>gr :topleft :split config/routes.rb<cr>

" open ruby Gemfile
map <leader>gg :topleft 100 :split Gemfile<cr>

" keep window on buffer delete
nmap <silent> <leader>bd <Plug>Kwbd

" use sudo to write the file
cmap w!! w !sudo tee % >/dev/null

" run the above commands only if vim is compiled with autocmd
if has("autocmd")
  autocmd BufWritePost .vimrc source $MYVIMRC " apply .vimrc settings on save
  autocmd BufWritePre *.rb,*.html,*.js,*.py :call <SID>StripTrailingWhitespaces() " remove trailing white spaces before saving (only in specified filetypes)
endif

" function to remove trailing white space (while saving cursor position)
" http://vimcasts.org/episodes/tidying-whitespace/

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

" function to delete all hidden buffers
function! Wipeout()
  " list of *all* buffer numbers
  let l:buffers = range(1, bufnr('$'))

  " what tab page are we in?
  let l:currentTab = tabpagenr()
  try
    " go through all tab pages
    let l:tab = 0
    while l:tab < tabpagenr('$')
      let l:tab += 1

      " go through all windows
      let l:win = 0
      while l:win < winnr('$')
        let l:win += 1
        " whatever buffer is in this window in this tab, remove it from
        " l:buffers list
        let l:thisbuf = winbufnr(l:win)
        call remove(l:buffers, index(l:buffers, l:thisbuf))
      endwhile
    endwhile

    " if there are any buffers left, delete them
    if len(l:buffers)
      execute 'bwipeout' join(l:buffers)
    endif
  finally
    " go back to our original tab page
    execute 'tabnext' l:currentTab
  endtry
endfunction

" mapping for function above
map <leader>bw :call Wipeout()<CR>

" functions ro run tests under rails project
function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    :silent !echo;echo;echo;echo;echo
    exec ":!bundle exec rspec " . a:filename
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_spec_file = match(expand("%"), '_spec.rb$') != -1
    if in_spec_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix . " --format=spec")
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number)
endfunction

" Run this file
map <leader>r :call RunTestFile()<cr>
" Run only the example under the cursor
map <leader>R :call RunNearestTest()<cr>
" Run all test files
map <leader>a :call RunTests('spec')<cr>
execute pathogen#infect()
call pathogen#helptags()
