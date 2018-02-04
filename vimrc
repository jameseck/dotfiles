call pathogen#infect()
call pathogen#helptags()
set laststatus=2
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set shiftwidth=2
set tabstop=4

set paste

" highlight trailing whitespace
match ErrorMsg '\s\+$'

" remove trailing whitespace
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

" toggle indentlines
nnoremap <Leader>il :IndentLinesToggle<CR>

let g:syntastic_eruby_ruby_quiet_messages =
    \ {'regex': 'possibly useless use of a variable in void context'}

let b:comment_leader = '# '
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> <leader>cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <leader>cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

autocmd BufNewFile,BufRead *.eyaml   set syntax=yaml

colorscheme default

let g:indentLine_showFirstIndentLevel=1
let g:indentLine_color_term = 239
let g:indentLine_char = '┆'
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_enabled = 0
let g:indentLine_indentLevel = 100
let vim_markdown_preview_github=1
let vim_markdown_preview_use_xdg_open=1

let g:go_version_warning = 0

