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
    " Interface
        Plug 'altercation/vim-colors-solarized'
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'edkolev/tmuxline.vim'
        Plug 'edkolev/promptline.vim'
    " Git
        Plug 'tpope/vim-fugitive'
    " Python
        Plug 'python-mode/python-mode', { 'for': 'python' }
        Plug 'davidhalter/jedi-vim', { 'for': 'python' }
        Plug 'nvie/vim-flake8', { 'for': 'python' }
    " nginx
        Plug 'chr4/nginx.vim', {'for': 'nginx' }
    " Gradle
        Plug 'tfnico/vim-gradle'
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
    " vim-flake8
        let g:flake8_show_in_file=1
        autocmd BufWritePost *.py call Flake8()
    " python-mode
        let g:pymode_folding = 0
        let g:pymode_options_max_line_length = 159
        let g:pymode_lint_on_write = 0 " Done by vim-flake8
        let g:pymode_rope_regenerate_on_write = 0
    " Solarized
        set term=xterm-256color
        set t_ut=
        set t_Co=256
        set background=dark
        let g:solarized_termtrans=1
        let g:solarized_termcolors=256
"        let g:solarized_contrast="high"
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
