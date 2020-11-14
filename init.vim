set nocompatible

call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'
"Plug 'rakr/vim-one'
Plug 'Raimondi/delimitMate'
" Plug 'posva/vim-vue'
Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'chrisyue/my-snips'
Plug 'mattn/emmet-vim'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'jwalton512/vim-blade'
Plug 'alvan/vim-closetag'
Plug 'preservim/nerdcommenter'
Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-surround'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'APZelos/blamer.nvim'
Plug 'ap/vim-css-color'
Plug 'ryanoasis/vim-devicons'
" Plug 'leafgarland/typescript-vim'
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'leafgarland/typescript-vim'
call plug#end()

filetype plugin indent on

" syntax reset
if has("syntax")
  syntax on
endif

if(has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

let g:termguicolors=256

if (has("termguicolors"))
  set termguicolors
endif

let g:yats_host_keyword = 1


" Disable arrow key Normal Mode
noremap <Up> <NOP>
noremap <DOWN> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Disable arrow key in Insert Mode
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <Up> <NOP>

" Disable arrow key in Visual Mode
vnoremap <Down> <NOP>
vnoremap <Left> <NOP>
vnoremap <Right> <NOP>
vnoremap <Up> <NOP>


" NERDTree Config
map <C-\> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:NERDSpaceDelims = 1

set nu
set autoindent
set smartindent
set breakindent
set breakindentopt=shift:2
"set formatoptions=l
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set formatoptions+=w
set cursorline
set clipboard=unnamed
set mouse=a
set foldmethod=indent
set foldnestmax=1
set nofoldenable
set foldlevel=99
nmap <LeftMouse> <NOP>
imap <LeftMouse> <NOP>
vmap <LeftMouse> <NOP>
"Indent Line
let g:indentLine_color_term = 239
let g:indentLine_char = '┆'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_first_char = '┆'
" Remove highlight
map <C-h> :nohl<CR>

if exists('$TMUX')
" Colors in tmux
  let &t_8f = "<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "<Esc>[48;2;%lu;%lu;%lum"
endif


"Vim one
colorscheme dracula
let g:airline_theme='onedark'
"colorscheme one
set background=dark
set t_Co=256
let g:onedark_termcolors=256
let g:lightline = {'colorscheme': 'onedark'}
" colorscheme onedark


" Fuzzy search (fzf)
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}


let g:UltiSnipsExpandTrigger="<C-e>"
"Use tab to switch the next trigger point, shit + tab on a trigger point
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
"Vertical splitting of the screen when using the UltiSnips Edit command
let g:UltiSnipsEditSplit="vertical"

nmap <silent> gw <Plug>(easymotion-overwin-f2) 
let g:EasyMotion_smartcase = 1

" No swapfile
set noswapfile

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes


" Coc-higlight
autocmd CursorHold * silent call CocActionAsync('highlight')

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
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

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

" Define some single Blade directives. This variable is used for highlighting only.
let g:blade_custom_directives = ['datetime', 'javascript']

" Define pairs of Blade directives. This variable is used for highlighting and indentation.
let g:blade_custom_directives_pairs = {
      \   'markdown': 'endmarkdown',
      \   'cache': 'endcache',
      \ }

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.js'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1

"let g:delimitMate_expand_space = 1
"let g:delimitMate_expand_cr = 2

inoremap {<CR> {<CR>} <C-o>O
inoremap [<CR> [<CR>] <C-o>O

" Prettier config
let g:prettier#autoformat = 0
let g:prettier#config#single_quote='true'
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

" Blamer.nvim
let g:blamer_delay = 200
let g:blamer_enabled = 1

" Colorcoder config
" let g:colorcoder_enable_filetypes = ['css', 'js', 'ts', 'php', 'graphql', 'scss', 'json', 'md', 'vue', 'less']

" yats config
" let g:yats_host_keyword = 1

" General Colors
" hi SpecialKey	ctermfg=244	cterm=none		guifg=#000000	gui=none

" Syntax highlighting
" Changed: Keyword, Type, String, Number, Identifier, Special, Comment, 
" PreProc,
" Statemment: return, ..
" Constant: Program constants, such as numbers, quoted strings, or true/false
" hi  Keyword     ctermfg=212  cterm=none  guifg=#ff79c6  gui=none
" hi  Statement   ctermfg=212  cterm=none  guifg=#ff79c6  gui=none
" hi  Constant    ctermfg=183  cterm=none  guifg=#bd93f9  gui=none
" hi  Number      ctermfg=183  cterm=none  guifg=#bd93f9  gui=none
" hi  PreProc     ctermfg=183  cterm=none  guifg=#bd93f9  gui=none
" hi  Function    ctermfg=159  cterm=none  guifg=#8be9fd  gui=none
" hi  Identifier  ctermfg=231  cterm=none  guifg=#f8f8f2  gui=none
" hi  Type        ctermfg=159  cterm=none  guifg=#8be9fd  gui=none
" hi  Special     ctermfg=212  cterm=none  guifg=#ff79c6  gui=none
" hi  String      ctermfg=229  cterm=none  guifg=#f1fa8c  gui=none
" hi  Comment     ctermfg=8  cterm=none  guifg=#808080  gui=none
" hi  Todo        ctermfg=183  cterm=none  guifg=#bd93f9  gui=none
syn match MyComment +\<const\>+
hi MyComment term=bold ctermfg=Red guifg=#bd93f9 gui=bold

" Links
hi! link FoldColumn    Folded
hi! link CursorColumn  CursorLine
hi! link NonText LineNr
hi! link SignColumn LineNr
hi! link CocErrorHighlight ErrorMsg
hi! link CocWarningHighlight WarningMsg

