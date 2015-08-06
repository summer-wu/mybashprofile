syntax on
set shiftwidth=4
set tabstop=4
" set background=dark 在terminal.app中会让字体变成粗体
set background=light
set wildmenu "When 'wildmenu' is on, command-line completion operates in an enhanced mode. 
"set guifont=Monaco:h14 用于MacVim 来自 https://github.com/macvim-dev/macvim/wiki/FAQ
set guifont=Monaco:h14
set hlsearch "高亮搜索
set cursorline "高亮所在行
set number "显示行号

"来自dotfiles
" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif
