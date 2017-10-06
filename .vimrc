" Required
set nocompatible              " be iMproved, required
filetype off                  " required

" Load vim-plug if it doesn't exist already
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin()
    " Misc
        Plug 'ntpeters/vim-better-whitespace'
"        Plug 'wikitopian/hardmode'
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'
        Plug 'tpope/vim-surround'
        Plug 'sjl/gundo.vim'
    " Interface
        Plug 'altercation/vim-colors-solarized'
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
"        Plug 'edkolev/tmuxline.vim'
        Plug 'edkolev/promptline.vim'
        Plug 'mhinz/vim-startify'
        Plug 'terryma/vim-smooth-scroll'
    " Git
"        Plug 'tpope/vim-fugitive'
        Plug 'airblade/vim-gitgutter'
    " Syntax
        Plug 'sheerun/vim-polyglot'
    " Python
        Plug 'davidhalter/jedi-vim', { 'for': 'python' }
        Plug 'nvie/vim-flake8', { 'for': 'python' }
    " Jinja2
        Plug 'glench/vim-jinja2-syntax'
call plug#end()
" plug#end() automatically runs:
" 'filetype plugin indent on' and 'syntax enable'

" Settings
    " Tabs
        set tabstop=4
        set softtabstop=4
        set shiftwidth=4
        set expandtab
        set smarttab
        set autoindent
        set smartindent
        set backspace=indent,eol,start
    " Search
        set hlsearch
        set incsearch
        set ignorecase
        set smartcase
    " Status line
        set laststatus=2
    " Allow hidden buffers
        set hidden
    " Highlight current line
        set cursorline
    " Show tab line
        set showtabline=1
    " Word wrap settings
        set wrap
        set nolist
    " Encoding settings
        set encoding=utf-8
        set fileencodings=utf8,cp1251
    " Command line completion
        set wildmenu
        set wildignore+=.hg,.git,.svn
        set wildignore+=*.DS_Store
        set wildignore+=*.pyc
    " Set title of terminal window
        set title
    " Show current incomplete command
        set showcmd
    " Split settings
        set splitbelow
        set splitright
    " Mouse support
        set mouse=a
    " Line numbers
        set relativenumber
        set number
    " Length of time Vim waits after you stop typing
    " before it triggers a plugin (used by vim-gitgutter)
        set updatetime=250
    " Set comma to be the leader
        let mapleader = ','

" Backup, swap, and undo
        set undofile
        set backupdir=~/.vim/backup,/tmp
        set directory=~/.vim/swap,/tmp
        set undodir=~/.vim/undo,/tmp

" Plugins
    " Gundo
        nnoremap <F6> :GundoToggle<CR>
        let g:gundo_prefer_python3 = 1
    " vim-flake8
        let g:flake8_show_in_gutter=1
        autocmd BufWritePost *.py call Flake8()
    " Solarized
        set term=xterm-256color
        set t_ut=
        set t_Co=256
        set background=dark
        let g:solarized_termtrans=1
        let g:solarized_termcolors=256
        colorscheme solarized
        set noshowmode
    " hardmode
        "let g:HardMode_level = 'wannabe'
        "autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
        "nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>
    " vim-airline
        let g:airline#extensions#tabline#enabled = 1
        let g:airline_powerline_fonts = 1
        let g:airline_theme='solarized'
    " promptline
        let g:promptline_theme = 'airline'
        let g:promptline_preset = {
                \'a' : [ promptline#slices#host() ],
                \'b' : [ '\t' ],
                \'c' : [ promptline#slices#cwd() ],
                \'y' : [ promptline#slices#vcs_branch(), promptline#slices#git_status(), promptline#slices#python_virtualenv() ],
                \'warn' : [ promptline#slices#last_exit_code() ]}"
    " vim-startify
        let g:startify_custom_header = ['']
    " vim-smooth-scroll
        noremap <silent> <C-j> :call smooth_scroll#down(&scroll, 10, 2)<CR>
        noremap <silent> <C-k> :call smooth_scroll#up(&scroll, 10, 2)<CR>

function! HideNumbers()
    set nonumber
    set norelativenumber
endfunction

command! -nargs=0 HideNumbers call HideNumbers()

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!{.git,.svn,fabric}/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" Reload ~/.vimrc after saving
autocmd! bufwritepost .vimrc source %
" jump to last used position in every file
autocmd bufreadpost * normal `"
" .src files get set to xml filetype
autocmd BufRead,BufNewFile *.src set filetype=xml
