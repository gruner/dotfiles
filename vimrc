set nocompatible    " Don't sacrifice anything for Vi compatibility.
set encoding=utf-8  " In case $LANG doesn't have a sensible value.

" pathogem.vim lets us keep plugins etc in their own folders under ~/.vim/bundle.
" http://www.vim.org/scripts/script.php?script_id=2332
" filetype off and then on again afterwards for ftdetect files to work properly.
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype plugin indent on  " Load plugin and indent settings for the detected filetype.
syntax on                  " Syntax highlighting.
color blackboard           " Default color scheme.
set number                 " Show gutter with line numbers.
set ruler                  " Show line, column and scroll info in status line.
set laststatus=2           " Always show status bar.
set modelines=10           " Use modeline overrides.
set showcmd                " Show partially typed command sequences.
set scrolloff=3            " Minimal number of lines to always show above/below the caret.

" Autocompleting filenames should prompt, not autopick at ambiguity.
set wildmode=longest,list

" Statusline.
" %< truncation point
" \  space
" %f relative path to file
" %m modified flag [+] (modified), [-] (unmodifiable) or nothing
" %r readonly flag [RO]
" %y filetype [ruby]
" %= split point for left and right justification
" %-14.( %)  block of fixed width 14 characters
" %l current line
" %c current column
" %V current virtual column as -{num} if different from %c
" %P percentage through buffer
set statusline=%#warningmsg#%{SyntasticStatuslineFlag()}%*%<\ %f\ %m%r%y\ %=%-14.(%l,%c%V%)\ %P\ 

set wrap  " Soft wrap.
" Would use lbr for nicer linebreaks, but can't combine with listchars.

" 2 spaces indent.
set softtabstop=2
set shiftwidth=2
set expandtab

" Show invisibles.
set listchars=nbsp:·,tab:▸\ ,trail:·
set list!

" No pipes in vertical split separators.
set fillchars=vert:\ 

" Searching.
set hlsearch    " Highlight results.
set incsearch   " Search-as-you-type.
set ignorecase  " Case-insensitive…
set smartcase   " …unless phrase includes uppercase.
set gdefault    " Global search by default; /g for first-per-row only.

set nojoinspaces                " 1 space, not 2, when joining sentences.
set backspace=indent,eol,start  " Allow backspacing over everything in insert mode.


" NERDTree configuration
let NERDTreeIgnore=['\.rbc$', '\~$']

" Command-T configuration
let g:CommandTMaxHeight=20
let g:CommandTMatchWindowAtTop=1

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" Remember last location in file, but not for commit messages.
if has("autocmd")
  au BufReadPost * if &filetype !~ 'commit\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" OS X only due to use of `open`. Adapted from
" http://vim.wikia.com/wiki/Open_a_web-browser_with_the_URL_in_the_current_line
" Uses John Gruber's URL regexp: http://daringfireball.net/2010/07/improved_regex_for_matching_urls

ruby << EOF
  def open_uri
    re = %r{(?i)\b((?:[a-z][\w-]+:(?:/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}/)(?:[^\s()<>]+|\((?:[^\s()<>]+|(?:\([^\s()<>]+\)))*\))+(?:\((?:[^\s()<>]+|(?:\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'".,<>?«»“”‘’]))}

    line = VIM::Buffer.current.line
    urls = line.scan(re).flatten

    if urls.empty?
      VIM::message("No URI found in line.")
    else
      system("open", *urls)
      VIM::message(urls.join(" and "))
    end
  end
EOF

function! OpenURI()
  ruby open_uri
endfunction

if has("autocmd")
  " make and python use real tabs
  au FileType make    set noexpandtab
  au FileType python  set noexpandtab

  " These files are also Ruby.
  au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,Vagrantfile,config.ru}  set ft=ruby

  " These files are also Markdown.
  au BufRead,BufNewFile *.{md,mdown,mkd,mkdn} set ft=markdown

  " <D-r> to render Markdown in browser.
  au FileType markdown map <buffer> <D-r> :Mm<CR>
endif

" Close help windows with just q.
au FileType HELP map <buffer> q :q<CR>


" Hit S in command mode to save, as :w<CR> is a mouthful and MacVim
" Command-S is a bad habit when using terminal Vim.
" We overload a command, but use 'cc' for that anyway.
noremap S :w<CR>

" Make Y consistent with C and D - yank to end of line, not full line.
nnoremap Y y$

" Map Q to something useful (e.g. QQ to hard-break current line).
" Otherwise Q enters the twilight zone of the 'Ex' mode.
noremap Q gq

nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" Map gp to select the last pasted text
" http://vim.wikia.com/wiki/Selecting_your_pasted_text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Move by screen lines instead of file lines.
" http://vim.wikia.com/wiki/Moving_by_screen_lines_instead_of_file_lines
noremap <Up> gk
noremap <Down> gj
noremap k gk
noremap j gj
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Save a file as root.
cabbrev w!! w !sudo tee % > /dev/null<CR>:e!<CR><CR>

" Move single lines.
nmap <C-Up> [e
nmap <C-Down> ]e
" Move multiple lines.
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Tab/shift-tab to indent/outdent in visual mode.
vmap <Tab> >gv
vmap <S-Tab> <gv

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" 'Edit anyway' if swap file exists.
au SwapExists * let v:swapchoice = 'e'

" Unbreak 'crontab -e' with Vim: http://drawohara.com/post/6344279/crontab-temp-file-must-be-edited-in-place
au FileType crontab set nobackup nowritebackup


" Leader

let mapleader = ","

" Un-highlight search matches
nnoremap <leader><leader> :noh<CR>

map <leader>n :NERDTreeToggle<CR>
map <leader>N :NERDTreeFind<CR>" Reveal current file

" Print highlighting scope at the current position.
" http://vim.wikia.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
map <leader>S :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

map <leader>T :CommandTFlush<CR>

" Open URL from this line (OS X only).
map <leader>u :call OpenURI()<CR>

" Ack/Quickfix windows
map <leader>q :cclose<CR>
" Previous fix and center line.
map - :cprev<CR> zz
" Next fix and center line.
map + :cnext<CR> zz
" See .gvimrc for cpf/cnf.

" Opens an edit command with the path of the currently edited file filled in
map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Create a split on the given side.
" From http://technotales.wordpress.com/2010/04/29/vim-splits-a-guide-to-doing-exactly-what-you-want/ via joakimk.
nmap <leader><left>   :leftabove  vsp<CR>
nmap <leader><right>  :rightbelow vsp<CR>
nmap <leader><up>     :leftabove  sp<CR>
nmap <leader><down>   :rightbelow sp<CR>

" Get rid of all NERDCommenter mappings except one.
let g:NERDCreateDefaultMappings=0
map <leader>c <Plug>NERDCommenterToggle


" Quicker filetype setting:
"   :F html
" instead of
"   :set ft=html
" Can tab-complete filetype.
command! -nargs=1 -complete=filetype F set filetype=<args>

" Even quicker setting often-used filetypes.
command! FR set filetype=ruby


" Strip trailing whitespace (including that in blank lines).
" http://vim.wikia.com/wiki/Remove_unwanted_spaces
command! Strip let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl


" :Loc to open locales in splits in a tab.
function! EditLocales()
  " Special case for this particular project.
  if getcwd() == "/Users/henrik/Sites/auktion"
    tabe config/locales/fi.yml
    vsp  config/locales/en.yml
    vsp  config/locales/sv.yml
  else
    tabe
    args config/locales/*.yml | vertical all
  endif
endfunction
command! Loc call EditLocales()
