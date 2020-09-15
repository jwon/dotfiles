" ------------ PLUGINS ------------
" Load vim-plug if it doesn't exist already
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
    " LSP
        Plug 'neovim/nvim-lspconfig'
        Plug 'nvim-lua/completion-nvim'
        Plug 'nvim-lua/diagnostic-nvim'
        Plug 'nvim-lua/lsp-status.nvim'
    " Functionality
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'
        Plug 'tpope/vim-surround'
        Plug 'simnalamburt/vim-mundo'
        Plug 'ntpeters/vim-better-whitespace'
        Plug 'majutsushi/tagbar'
        Plug 'neomake/neomake'
        Plug 'sbdchd/neoformat'
    " Themes
        Plug 'arcticicestudio/nord-vim'
    " Visual
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'edkolev/promptline.vim'
        Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
        Plug 'mhinz/vim-signify'
    " Git
        Plug 'tpope/vim-fugitive'
    " Syntax
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
    " before it triggers a plugin (used by vim-signify)
        set updatetime=100
    " Set space to be the leader
        nnoremap <SPACE> <Nop>
        let mapleader = "\<Space>"
    " True Colors
        set termguicolors
    " Backup, swap, and undo
        set undofile

" ------------ PLUGIN SETTINGS ------------
    " Python Support
    " cd $HOME && python3 -m venv venv && venv/bin/pip install pynvim
        let g:python3_host_prog = expand('~/venv/bin/python')
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
    " Neomake
        let g:neomake_open_list = 2
        call neomake#configure#automake('nw', 1000)
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


" ------------- NVIM LSP SETTINGS ------------
" Log file location: ~/.local/share/nvim/lsp.log
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_virtual_text_prefix = '👈🏻 '
" Install `gopls`: `GO111MODULE=on go get golang.org/x/tools/gopls@latest`
" Install `jsonls`: `:LspInstall jsonls`
" Install `pyls_ms`: `:LspInstall pyls_ms`
lua <<EOF
local lsp_status = require('lsp-status')
-- use LSP SymbolKinds themselves as the kind labels
local kind_labels_mt = {__index = function(_, k) return k end}
local kind_labels = {}
setmetatable(kind_labels, kind_labels_mt)

lsp_status.register_progress()
lsp_status.config({
  kind_labels = kind_labels,
  indicator_errors = "×",
  indicator_warnings = "!",
  indicator_info = "i",
  indicator_hint = "›",
  -- the default is a wide codepoint which breaks absolute and relative
  -- line counts if placed before airline's Z section
  status_symbol = "",
})

local nvim_lsp = require('nvim_lsp')

local on_attach_vim = function(client)
  require'diagnostic'.on_attach(client)
  require'completion'.on_attach(client)
  lsp_status.on_attach(client)
end

nvim_lsp.gopls.setup{on_attach=on_attach_vim}
nvim_lsp.jsonls.setup{on_attach=on_attach_vim}
nvim_lsp.pyls_ms.setup({
  callbacks = lsp_status.extensions.pyls_ms.setup(),
  settings = {
    python = {
      workspaceSymbols = {
        enabled = true;
      };
    };
  },
  on_attach=on_attach_vim,
  capabilities = lsp_status.capabilities
})
EOF

" Statusline
function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction
call airline#parts#define_function('lsp_status', 'LspStatus')
call airline#parts#define_condition('lsp_status', 'luaeval("#vim.lsp.buf_get_clients() > 0")')
let g:airline#extensions#nvimlsp#enabled = 0
let g:airline_section_warning = airline#section#create_right(['lsp_status'])

" LSP omnifunc
autocmd Filetype go,json,python setlocal omnifunc=v:lua.vim.lsp.omnifunc

" LSP remaps
nnoremap <silent> <c-]>         <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K             <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD            <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k>         <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD           <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr            <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0            <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW            <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd            <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <leader>rn    <cmd>lua vim.lsp.buf.rename()<CR>

" Always show line diagnostics
autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()

"" completion-nvim settings
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c

"" diagnostic-nvim settings
call sign_define("LspDiagnosticsErrorSign", {"text" : "🔥", "texthl" : "LspDiagnosticsError"})
call sign_define("LspDiagnosticsWarningSign", {"text" : "⚠️", "texthl" : "LspDiagnosticsWarning"})
call sign_define("LspDiagnosticsInformationSign", {"text" : "ℹ️", "texthl" : "LspDiagnosticsInformation"})
call sign_define("LspDiagnosticsHintSign", {"text" : "🤔", "texthl" : "LspDiagnosticsHint"})

" ------------ FZF SETTINGS ------------
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
set grepprg=rg\ --vimgrep
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!{.git,.svn,fabric}/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

function! Fzf_dev()
  let l:fzf_files_options = '--preview "bat --theme="OneHalfDark" --style=numbers,changes --color always {2..-1} | head -'.&lines.'"'

  function! s:files()
    let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(l:files)
  endfunction

  function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:filename = fnamemodify(l:candidate, ':p:t')
      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
      call add(l:result, printf('%s %s', l:icon, l:candidate))
    endfor

    return l:result
  endfunction

  function! s:edit_file(item)
    let l:pos = stridx(a:item, ' ')
    let l:file_path = a:item[pos+1:-1]
    execute 'silent e' l:file_path
  endfunction

  call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink':   function('s:edit_file'),
        \ 'options': '-m ' . l:fzf_files_options,
        \ 'down':    '70%' })
endfunction
" ------------ COMMANDS / FUNCTIONS ------------


" ------------ AUTOCMD ------------
" Reload init.vim after saving
autocmd! BufWritePost init.vim source %
" jump to last used position in every file
autocmd bufreadpost * normal `"
" .src files get set to xml filetype
autocmd BufRead,BufNewFile *.src set filetype=xml

" Auto-format on save
autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)

" ------------ REMAPS ------------
" FZF remaps
nnoremap <C-p> :call Fzf_dev()<CR>
nnoremap <C-g> :Rg<Cr>

" Gundo
nnoremap <leader>u :MundoToggle<CR>
" Toggle line numbers
nnoremap <leader>n :set number! relativenumber!<CR>
" Tagbar
nnoremap <leader>t :TagbarToggle<CR>
" Buffer navigation with arrow keys
nnoremap <left> :bprevious<CR>
nnoremap <right>   :bnext<CR>
