" Required
filetype off
filetype plugin indent on
syntax on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugins
        Plugin 'gmarik/vundle'
    " Misc
        Plugin 'spacehi.vim'
        Plugin 'wikitopian/hardmode'
    "Buffer
        Plugin 'lastpos.vim'
        Plugin 'bufpos'
        Plugin 'buftabs'
    " Interface
"        Plugin 'molokai'
        Plugin 'altercation/vim-colors-solarized.git'
        Plugin 'scrooloose/syntastic'
        Plugin 'scrooloose/nerdtree'
    " Python/Django
        Plugin 'python.vim'
    " Scala
        Plugin 'derekwyatt/vim-scala'
call vundle#end()

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
    " Misc
        set hidden
        set cursorline
        set showtabline=1
        set wrap
        set encoding=utf-8
        set fileencodings=utf8,cp1251
        set wildmenu
        set wildignore+=.hg,.git,.svn
        set wildignore+=*.DS_Store
        set wildignore+=*.pyc
        set title
        set showcmd
        set nolist

        if version >= 703
            set colorcolumn=132
        end

        set t_Co=256
        set splitbelow
        set splitright
        set mouse=a

" Status line
    function! FileSize()
        let bytes = getfsize(expand("%:p"))
        if bytes <= 0
            return ""
        endif
        if bytes < 1024
            return bytes . "B"
        else
            return (bytes / 1024) . "K"
        endif
    endfunction

    function! CurDir()
        let curdir = substitute(expand('%:p'), '/Users/jwon', '~', 'g')
        return curdir
    endfunction

    set laststatus=2
    set statusline=\
    set statusline+=%n:\ " buffer number
    set statusline+=%t " filename with full path
    set statusline+=\ \
    set statusline+=%{&paste?'[paste]\ ':''}
    set statusline+=%{&fileencoding}
    set statusline+=\ \ %Y " type of file
    set statusline+=\ %3.3(%c%) " column number
    set statusline+=\ \ %3.9(%l/%L%) " line / total lines
    set statusline+=\ \ %2.3p%% " percentage through file in lines
    set statusline+=\ \ %{FileSize()}
    set statusline+=%< " where truncate if line too long
    set statusline+=\ \ CurDir:%{CurDir()}

" Ruler
    set ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)

" Temp dirs
    set backupdir=~/.vim/backup,/tmp
    set directory=~/.vim/swp//,/tmp

" Plugins
    " NERDTree
        nmap <Bs> :NERDTreeToggle<CR>
        let NERDTreeShowBookmarks=1
        let NERDTreeChDirMode=2
        let NERDTreeQuitOnOpen=1
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=0
        let NERDTreeMinimalUI=1 " Disables display of the 'Bookmarks' label and 'Press ? for help' text.
        let NERDTreeDirArrows=1 " Tells the NERD tree to use arrows instead of + ~ chars when displaying directories.
    " Solarized
        syntax enable
        set term=xterm-256color
        set t_ut=
        set t_Co=256
        set background=dark
        let g:solarized_termtrans=1
        let g:solarized_termcolors=16
"        let g:solarized_contrast="high"
        colorscheme solarized
    " Spacehi
        autocmd syntax * SpaceHi
    " vim-scala (shouldnt need this, but fix from: https://github.com/derekwyatt/vim-scala/issues/75
        autocmd BufRead,BufNewFile *.scala set filetype=scala
    " syntastic
        let g:syntastic_python_checkers = ['flake8']
        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 1
        let g:syntastic_check_on_open = 1
        let g:syntastic_check_on_wq = 0
    " hardmode
        let g:HardMode_level = 'wannabe'
        autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
        nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>
