" Load vim-plug if it doesn't exist already
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
    " Functionality
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'
        Plug 'tpope/vim-surround'
        Plug 'sjl/gundo.vim'
        Plug 'mhinz/vim-startify'
    " Themes
        Plug 'arcticicestudio/nord-vim'
    " Aesthetic
        Plug 'ntpeters/vim-better-whitespace'
        "Plug 'Yggdroot/indentLine'
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'edkolev/promptline.vim'
        "Plug 'terryma/vim-smooth-scroll'
    " Git
        Plug 'tpope/vim-fugitive'
        Plug 'airblade/vim-gitgutter'
    " Syntax
        "Plug 'sheerun/vim-polyglot'
        "Plug 'glench/vim-jinja2-syntax'
    " Always load vim-devicons as the very last one
        Plug 'ryanoasis/vim-devicons'
call plug#end()
" plug#end() automatically runs:
" 'filetype plugin indent on' and 'syntax enable'

" Settings
    " Tabs
        set tabstop=8
        set softtabstop=4
        set shiftwidth=4
        set expandtab
    " Search
        set ignorecase
        set smartcase
    " Allow hidden buffers
        set hidden
    " Highlight current line
        set cursorline
    " Show tab line
        set showtabline=1
    " Word wrap settings
        set wrap
        set nolist
    " Command line completion
        set wildignore+=.hg,.git,.svn
        set wildignore+=*.DS_Store
        set wildignore+=*.pyc
    " Set title of terminal window
        set title
    " Split settings
        set splitbelow
        set splitright
    " Mouse support
        set mouse=a
    " Line numbers
        " set relativenumber
        set number
    " Length of time Vim waits after you stop typing
    " before it triggers a plugin (used by vim-gitgutter)
        set updatetime=250
    " Set space to be the leader
        nnoremap <SPACE> <Nop>
        let mapleader = "\<Space>"
    " True Colors
        set termguicolors

" Backup, swap, and undo
        set undofile

" Plugins
    " Gundo
        nnoremap <F6> :GundoToggle<CR>
        let g:gundo_prefer_python3 = 1
    " Color Scheme
        colorscheme nord
    " vim-airline
        let g:airline#extensions#tabline#enabled = 1
        let g:airline_powerline_fonts = 1
        let g:airline_theme='nord'
    " promptline
        let g:promptline_theme = 'airline'
        let g:promptline_preset = {
                \'a' : [ promptline#slices#host() ],
                \'b' : [ '%*' ],
                \'c' : [ promptline#slices#cwd() ],
                \'y' : [ promptline#slices#vcs_branch(), promptline#slices#git_status(), promptline#slices#python_virtualenv() ],
                \'warn' : [ promptline#slices#last_exit_code() ]}"
    " vim-startify
        let g:startify_custom_header = ['']
    " vim-smooth-scroll
        noremap <silent> <C-j> :call smooth_scroll#down(&scroll, 10, 2)<CR>
        noremap <silent> <C-k> :call smooth_scroll#up(&scroll, 10, 2)<CR>
    " indentLine
        let g:indentLine_char = '┆'
        let g:indentLine_setColors = 0
    " vim-markdown
        let g:vim_markdown_conceal = 0
        let g:vim_markdown_folding_disabled = 1

function! HideNumbers()
    set nonumber
    "set norelativenumber
endfunction

command! -nargs=0 HideNumbers call HideNumbers()

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!{.git,.svn,fabric}/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" Reload ~/.vimrc after saving
autocmd! bufwritepost init.vim source %
" jump to last used position in every file
autocmd bufreadpost * normal `"
" .src files get set to xml filetype
autocmd BufRead,BufNewFile *.src set filetype=xml

" Buffer navigation with arrow keys
nnoremap <left> :bprevious<CR>
nnoremap <right>   :bnext<CR>
