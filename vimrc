"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundel Plugin Manager
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible          
filetype off             
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tomasr/molokai' "主题
Plugin 'scrooloose/nerdtree' "目录
Plugin 'jiangmiao/auto-pairs' "括号、引号等自动补全
call vundle#end()            
filetype plugin indent on 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin set
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin 'tomasr/molokai'
colorscheme molokai

" Plugin 'scrooloose/nerdtree'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General set
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置显示行号
set number

"设置tab键
set tabstop=4 "set 1tab = 4space
set shiftwidth=4 "set 1Backspace = 4space 与tabstop同步设置

"设置自动缩进
set autoindent

