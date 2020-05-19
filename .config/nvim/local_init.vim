colorscheme dracula
let g:airline_theme = 'dracula'

map <C-n> :NERDTreeToggle<CR>
map <C-b> :NERDTreeFind<CR>

" Vdebug config
hi! link DbgBreakptSign DraculaOrangeInverse
hi! link DbgBreakptLine DbgBreakptSign
hi! link DbgCurrentSign DraculaRedInverse
hi! link DbgCurrentLine DbgCurrentSign

" Allows Vdebug to bind to all interfaces.
let g:vdebug_options = {}

" Mapping '/remote/path' : '/local/path'
let g:vdebug_options['path_maps'] = {
      \  '/usr/share/sellercenter' : '/home/afranio/Projects/Linio/seller-center',
      \  '/application' : '/home/afranio/Projects/Linio/sellercenter-feeds-api'
      \}

let g:vdebug_options['server'] = ""

" Disable stop on entry
let g:vdebug_options['break_on_open'] = 0

" Because it's the company default.
let g:vdebug_options['ide_key'] = 'phpstorm'

" Use the compact window layout.
let g:vdebug_options['watch_window_style'] = 'compact'

set cc=120
set mouse=a

let g:airline_powerline_fonts = 1

" Can be enabled or disabled
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_startify = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_startify = 1

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeGitStatusWithFlags = 1

" vim-bbye
:nnoremap <Leader>c :Bdelete<CR>

" coc.vim init
let g:coc_global_extensions=[
    \ 'coc-spell-checker',
    \ 'coc-actions',
    \ 'coc-bookmark',
    \ 'coc-omnisharp',
    \ 'coc-tsserver',
    \ 'coc-phpls',
    \ 'coc-xml',
    \ 'coc-yaml',
    \ 'coc-json',
    \ 'coc-markdownlint',
    \ 'coc-yank',
    \ 'coc-vimlsp',
    \ 'coc-todolist',
    \ 'coc-snippets'
    \ ]

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-leftmouse> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
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
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

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
nnorem <silent> <space>a  :<C-u>CocList diagnostics<cr>
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

nmap <Leader>bt <Plug>(coc-bookmark-toggle)
nmap <Leader>ba <Plug>(coc-bookmark-annotate)
nmap <Leader>bj <Plug>(coc-bookmark-next)
nmap <Leader>bk <Plug>(coc-bookmark-prev)
" Show bookmarks.
nnoremap <silent> <space>b :<C-u>CocList bookmark<cr>
" coc.vim end

" php
augroup vim-php-namespace
  autocmd FileType php inoremap <Leader>s <Esc>:call PhpSortUse()<CR>
  autocmd FileType php noremap <Leader>s :call PhpSortUse()<CR>
augroup END

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

noremap <silent> <Leader><Leader> :Shortcuts<Return>
noremap <silent> <Leader> :Shortcuts<Return>
source ~/.config/nvim/plugged/vim-shortcut/plugin/shortcut.vim

"" Include shortcuts
if filereadable(expand("~/.config/nvim/local_shortcuts.vim"))
  source ~/.config/nvim/local_shortcuts.vim
endif

" ripgrep - ignore case
command! -bang -nargs=* Rgi
  \ call fzf#vim#grep(
  \   "rg --column --line-number --no-heading --color=always --ignore-case ".shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

augroup PhpactorMappings
    au!
    au FileType php nmap <buffer> <Leader>ci :PhpactorImportClass<CR>
    au FileType php nmap <buffer> <Leader>ce :PhpactorClassExpand<CR>
    au FileType php nmap <buffer> <Leader>ua :PhpactorImportMissingClasses<CR>
    au FileType php nmap <buffer> <Leader>mm :PhpactorContextMenu<CR>
    au FileType php nmap <buffer> <Leader>nn :PhpactorNavigate<CR>
    au FileType php,cucumber nmap <buffer> <Leader>oo
        \ :PhpactorGotoDefinition<CR>
    au FileType php,cucumber nmap <buffer> <Leader>Oh
        \ :PhpactorGotoDefinitionHsplit<CR>
    au FileType php,cucumber nmap <buffer> <Leader>Ov
        \ :PhpactorGotoDefinitionVsplit<CR>
    au FileType php,cucumber nmap <buffer> <Leader>Ot
        \ :PhpactorGotoDefinitionTab<CR>
    au FileType php nmap <buffer> <Leader>K :PhpactorHover<CR>
    au FileType php nmap <buffer> <Leader>tt :PhpactorTransform<CR>
    au FileType php nmap <buffer> <Leader>cc :PhpactorClassNew<CR>
    au FileType php nmap <buffer> <Leader>ci :PhpactorClassInflect<CR>
    au FileType php nmap <buffer> <Leader>fr :PhpactorFindReferences<CR>
    au FileType php nmap <buffer> <Leader>mf :PhpactorMoveFile<CR>
    au FileType php nmap <buffer> <Leader>cf :PhpactorCopyFile<CR>
    au FileType php nmap <buffer> <silent> <Leader>ee
        \ :PhpactorExtractExpression<CR>
    au FileType php vmap <buffer> <silent> <Leader>ee
        \ :<C-u>PhpactorExtractExpression<CR>
    au FileType php vmap <buffer> <silent> <Leader>em
        \ :<C-u>PhpactorExtractMethod<CR>
augroup END
