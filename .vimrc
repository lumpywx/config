set nocompatible
set backspace=indent,eol,start
set history=1000        " keep 1000 lines of command line history
set ruler        " show the cursor position all the time
set showcmd        " display incomplete commands
set incsearch        " do incremental searching
map Q gq
inoremap <C-U> <C-G>u<C-U>
if has('mouse')
  set mouse=a
endif
syntax on
set nu
filetype on
set nobackup
set cindent
set smartindent
set tabstop=4
set shiftwidth=4
set showmatch
set vb t_vb= 
set nohls
set aw
set showmode
set ts=4
set wm=4
set si
set wrap
colorscheme desert
"cpp
set cin
set cino=:0g0(sus  
"":0表示带:的不会缩进，g0表示类中public等不会缩进
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gbk,gb18030,big5,euc-jp,euc-k,latin-1	
map <F2>   <Esc><S-$>a<TAB>/* */<Esc>2ha
ab email /*wzlxx.c@gmail.com*/
"代码折叠
set fdm=syntax
"set foldmethod=indent
"set foldlevel=3
""script
function Script(arg)
	if a:arg==1
		call append(0,"#!/usr/bin/env perl")
		call append(1,"use strict;")
		call append(2,"use warnings;")
	elseif a:arg==2
		call append(0,"#!/bin/sh")
	elseif a:arg==3
		call append(0,"#!/usr/bin/env python")
	endif
endf
autocmd BufNewFile *.pl exec ":call Script(1)"
autocmd BufNewFile *.sh exec ":call Script(2)"
autocmd BufNewFile *.py exec ":call Script(3)"
