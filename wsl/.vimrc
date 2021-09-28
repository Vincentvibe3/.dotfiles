set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
call vundle#end()
filetype plugin indent on
autocmd FileType python setlocal completeopt-=preview
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16_spacemacs'
set nu
:highlight LineNr ctermfg=grey
nnoremap <C-t> :NERDTreeToggle<CR>
