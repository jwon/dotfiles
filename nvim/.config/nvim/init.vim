" ------------ PLUGINS ------------
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
        Plug 'ntpeters/vim-better-whitespace'
        Plug 'preservim/nerdtree'
        Plug 'Xuyuanp/nerdtree-git-plugin'
        Plug 'majutsushi/tagbar'
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Themes
        Plug 'arcticicestudio/nord-vim'
    " Visual
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'edkolev/promptline.vim'
        Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
    " Git
        Plug 'tpope/vim-fugitive'
        Plug 'airblade/vim-gitgutter'
    " Language Support
        "Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
        Plug 'glench/vim-jinja2-syntax'
        Plug 'chr4/nginx.vim'
    " Always load vim-devicons as the very last one
        Plug 'ryanoasis/vim-devicons'
call plug#end()
" plug#end() automatically runs:
" 'filetype plugin indent on' and 'syntax enable'

" ------------ SETTINGS ------------
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
        set relativenumber
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

" ------------ PLUGIN SETTINGS ------------
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
    " vim-markdown
        let g:vim_markdown_conceal = 0
        let g:vim_markdown_folding_disabled = 1
    " vim-go
        "" use golang language server
        "let g:go_def_mode='gopls'
        "let g:go_info_mode='gopls'
        "" Highlight more info
        "let g:go_highlight_build_constraints = 1
        "let g:go_highlight_extra_types = 1
        "let g:go_highlight_fields = 1
        "let g:go_highlight_functions = 1
        "let g:go_highlight_methods = 1
        "let g:go_highlight_operators = 1
        "let g:go_highlight_structs = 1
        "let g:go_highlight_types = 1
        "" highlight same variable in view
        "let g:go_auto_sameids = 1
        "" show type info in statusbar
        "let g:go_auto_type_info = 1
        "" disable gd mapping of vim-go
        "let g:go_def_mapping_enabled = 0
    " tagbar
        let g:tagbar_autofocus = 1
        let g:tagbar_type_go = {
                \ 'ctagstype' : 'go',
                \ 'kinds'     : [
                        \ 'p:package',
                        \ 'i:imports:1',
                        \ 'c:constants',
                        \ 'v:variables',
                        \ 't:types',
                        \ 'n:interfaces',
                        \ 'w:fields',
                        \ 'e:embedded',
                        \ 'm:methods',
                        \ 'r:constructor',
                        \ 'f:functions'
                \ ],
                \ 'sro' : '.',
                \ 'kind2scope' : {
                        \ 't' : 'ctype',
                        \ 'n' : 'ntype'
                \ },
                \ 'scope2kind' : {
                        \ 'ctype' : 't',
                        \ 'ntype' : 'n'
                \ },
                \ 'ctagsbin'  : 'gotags',
                \ 'ctagsargs' : '-sort -silent'
        \ }

" ------------ COC.NVIM SETTINGS ------------
" Give more space for displaying messages.
set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <S-TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" ------------ COMMANDS / FUNCTIONS ------------
"command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!{.git,.svn,fabric}/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" ------------ AUTOCMD ------------
" Reload init.vim after saving
autocmd! bufwritepost init.vim source %
" jump to last used position in every file
autocmd bufreadpost * normal `"
" .src files get set to xml filetype
autocmd BufRead,BufNewFile *.src set filetype=xml
" === NERDTree settings ===
" Open NERDTree if no files were specified on startup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close vim if only window open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ------------ REMAPS ------------
" Fuzzy Find
" nnoremap <leader>f :Find<CR>
" Gundo
nnoremap <leader>u :GundoToggle<CR>
" NERDTree
nnoremap <leader>t :NERDTreeToggle<CR>
" Toggle line numbers
nnoremap <leader>n :set number! relativenumber!<CR>
" Tagbar
nnoremap <leader>b :TagbarToggle<CR>
" Buffer navigation with arrow keys
nnoremap <left> :bprevious<CR>
nnoremap <right>   :bnext<CR>
" Restart coc
nnoremap <leader>, :CocRestart<CR>
