" Required
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugins
        Plugin 'VundleVim/Vundle.vim'
    " Misc
        Plugin 'ntpeters/vim-better-whitespace'
        Plugin 'wikitopian/hardmode'
        Plugin 'ctrlpvim/ctrlp.vim.git'
    "Buffer
        Plugin 'lastpos.vim'
    " Interface
        Plugin 'altercation/vim-colors-solarized.git'
        Plugin 'scrooloose/syntastic'
        Plugin 'scrooloose/nerdtree'
        Plugin 'vim-airline/vim-airline'
        Plugin 'vim-airline/vim-airline-themes'
        Plugin 'edkolev/tmuxline.vim'
        Plugin 'edkolev/promptline.vim'
    " Python
        Plugin 'python.vim'
        Plugin 'davidhalter/jedi-vim.git'
    " nginx
        Plugin 'chr4/nginx.vim'
    " Gradle
        Plugin 'tfnico/vim-gradle'
call vundle#end()
filetype plugin indent on

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
        set splitbelow
        set splitright
        set mouse=a
        set relativenumber
        set number

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
        let g:solarized_termcolors=256
"        let g:solarized_contrast="high"
        colorscheme solarized
        set noshowmode
    " syntastic
        let g:syntastic_python_checkers = ['flake8']
        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 1
        let g:syntastic_mode_map = {
            \ "mode": "active",
            \ "passive_filetypes": ["java"] }
        let g:syntastic_check_on_open = 1
"        let g:syntastic_check_on_wq = 0
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

function! HideNumbers()
    set nonumber
    set norelativenumber
endfunction

command! -nargs=0 HideNumbers call HideNumbers()

" Making copy/paste work with remote tmux (https://gist.github.com/burke/5960455)
" function! PropagatePasteBufferToOSX()
"     let @n=getreg('"')
"     call system('pbcopy-remote', @n)
"     echo "done"
" endfunction
" function! PopulatePasteBufferFromOSX()
"     let @" = system('pbpaste-remote')
"     echo "done"
" endfunction
" nnoremap <leader>bp :call PopulatePasteBufferFromOSX()<cr>
" nnoremap <leader>bc :call PropagatePasteBufferToOSX()<cr>
