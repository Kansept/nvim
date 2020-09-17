set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set nohlsearch
set number
set ruler
set list

set exrc
set secure

set mouse=a

nmap о j
nmap л k
nmap р h
nmap д l
nmap ш i
nmap ф a
nmap в d

vnoremap <C-V> "*p 
vnoremap <C-C> "*y

tnoremap <Esc> <C-\><C-n>

syntax on

call plug#begin('~/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'joshdick/onedark.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'godlygeek/tabular'
Plug 'jlanzarotta/bufexplorer'
Plug 'neoclide/coc.nvim'
Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'sahibalejandro/vim-php'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mattn/emmet-vim'
Plug 'tobyS/pdv'
Plug 'tobyS/vmustache'
Plug 'vim-vdebug/vdebug'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'StanAngeloff/php.vim'
Plug 'easymotion/vim-easymotion'
Plug 'skanehira/docker.vim'
Plug 'mileszs/ack.vim'
Plug 'andymass/vim-matchup'
Plug 'vim-syntastic/syntastic'
call plug#end()

set termguicolors     " enable true colors support
let ayucolor="mirage" " for mirage version of theme
colorscheme ayu

au VimEnter *  NERDTree
map <C-n> :NERDTreeToggle<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

nmap <F8> :TagbarToggle<CR>

nmap <Leader>e :call phpactor#ImportClass()<CR>

let cwd = getcwd()

let g:vdebug_options = {}
let g:vdebug_options["port"] = 9000
let g:vdebug_options["path_maps"] = {
\    "/var/www/html": getcwd(),
\    'timeout' : 10,
\    'break_on_open' : 0,
\}
g:vdebug_options.break_on_open = 0

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <Leader>fw ':Ack '.expand('<cword>').'<CR>'
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <Leader>gs   <Plug>(coc-git-chunkinfo)
nmap <Leader>gsu  <Plug>(coc-git-chunk-undo)

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

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

nnoremap <C-p> :GFiles<CR>  
nnoremap <C-t> :tabnew<CR>:term<CR>  
nnoremap <C-b> :Buffers<CR>  

