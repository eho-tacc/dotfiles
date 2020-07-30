syntax on
filetype plugin indent on

set nocompatible
set hidden
set relativenumber
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" leader key
let mapleader = " "

" ********************************* Functions *********************************

function! ToggleGruvboxBG()
    if &background == 'dark'
        set background=light
    else
        set background=dark
    endif
endfunction

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" ************************************ Plugins ********************************

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'morhetz/gruvbox'
Plug 'kshenoy/vim-signature'
Plug 'vimwiki/vimwiki'

call plug#end()

" ctrl-p
set runtimepath^=~/.vim/bundle/ctrlp.vim

" netrw
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 15

" ctrl p
let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" ************************************ Colors *********************************

" gruvbox, baby
autocmd vimenter * colorscheme gruvbox
let g:gruvbox_contrast_light='hard'
let g:gruvbox_contrast_dark='medium'
set background=light

" ************************************ Keymaps ********************************

" pane navigation
nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent> <leader>j :wincmd j<CR>
nnoremap <silent> <leader>k :wincmd k<CR>
nnoremap <silent> <leader>l :wincmd l<CR>
nnoremap <silent> <leader>b gT
nnoremap <silent> <leader>w gt
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :Vex<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
nnoremap <leader>tn :tabnew<SPACE>

" nav remaps
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <leader>tml :tabmove -1<CR>
nnoremap <leader>tmr :tabmove +1<CR>

" misc
noremap <leader>y "*y
noremap <leader>p "*p
noremap <leader>dws :s/\s\+$//g<CR>

" git aliases
nnoremap <leader>gst :Git<CR>
nnoremap <leader>gci :Git commit<CR>
nnoremap <leader>gbr :Git branch<SPACE>
nnoremap <leader>gco :Git checkout<SPACE>
nnoremap <leader>gdf :Git diff<SPACE>
nnoremap <leader>gadd :Git add<SPACE>

" toggle light/dark BG
nnoremap <leader>1 :call ToggleGruvboxBG()<CR>

" vimwiki
nmap ,wt <Plug>VimwikiTabIndex
nmap ,ws <Plug>VimwikiUISelect
nmap ,wi <Plug>VimwikiDiaryIndex
nmap ,w,w <Plug>VimwikiMakeDiaryNote
nmap ,w,t <Plug>VimwikiTabMakeDiaryNote
nmap ,w,y <Plug>VimwikiMakeYesterdayDiaryNote
nmap ,w,m <Plug>VimwikiMakeTomorrowDiaryNote
nmap ,wh <Plug>Vimwiki2HTML
nmap ,whh  <Plug>Vimwiki2HTMLBrowse
nmap ,w,wk <Plug>VimwikiDiaryGenerateLinks
nmap ,w,w <Plug>VimwikiMakeDiaryNote
nmap ,wr <Plug>VimwikiRenameFile
nmap ,wd <Plug>VimwikiDeleteFile
nmap ,wn <Plug>VimwikiGoto
nmap ,ww <Plug>VimwikiIndex
nmap <C-Tab> <Plug>VimwikiNextLink

" autocompleters
autocmd BufWritePre * :call TrimWhitespace()
