""" ctags, fzf, NERDTree refresh

function Refresh()
  echo "refreshing tags and files..."

  silent !if [ -d .git ]; then git ls-files -c -o --exclude-standard | ctags -L -; else ctags -R; fi

  if exists("t:NERDTreeBufName")
    let nr = bufwinnr(t:NERDTreeBufName)
    if nr != -1
      exe nr . "wincmd w"
      exe substitute(mapcheck("R"), "<CR>", "", "")
      wincmd p
    endif
  endif
endfunction

map <silent> <Leader>r :call Refresh()<CR>


""" fzf exclusions
set wildignore+=*/vendor/*,tags,*/gen-java/*


""" vimwiki config
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki'}]
""":autocmd FileType vimwiki map d :VimwikiMakeDiaryNote
""":autocmd FileType vimwiki unmap d
function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction
:autocmd FileType vimwiki map <Leader>c :call ToggleCalendar()

" Remove default clipboard integration
" set clipboard=unnamed

" Keybindings for system clipboard
" Copy to system clipboard
vnoremap <Leader>y "+y
nnoremap <Leader>y "+yy

" Paste from system clipboard
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P
