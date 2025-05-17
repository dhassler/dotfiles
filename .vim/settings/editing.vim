" basic editing
let mapleader = ','
let maplocalleader = ','

" enable plugin filetypes and indentation
filetype plugin indent on

" move quickly between splits
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

map :vs :vsplit<cr><c-w>l

" fast zoom for a split
map <C-_> <C-w>_

" use ,F to jump to tag in a vertical split
nnoremap <silent> ,F :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr>

" use ,gf to go to file in a vertical split
nnoremap <silent> ,gf :vertical botright wincmd f<CR>

" get the last pasted text (via evilchelu)
nnoremap gb '[V']

if !has("gui_running")
  " set custom cursor -- vertical bar in insert mode (iTerm2)
  " from http://www.iterm2.com/#/section/documentation/escape_codes
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" strip leading tabs and trailing whitespace
command Tr %s/\s\+$//ge | %s/\t/  /ge | nohlsearch

" replace the selected text
vnoremap <C-r> "hy:%s/\V<C-r>=escape(@h,'/')<CR>//gc<left><left><left>

" search for the selected text in the current file
" this is useful for more complex strings than #/* can search
vnoremap <C-f> "hy:/\V<C-r>=escape(@h,'/')<CR>/<CR>

if has("gui_running")
  " cmd-l for clearing search highlights
  nnoremap <D-l> :nohlsearch<CR>:ccl<CR>
  inoremap <D-l> <C-O>:nohlsearch<CR>:ccl<CR>
else
  nnoremap <CR> :nohlsearch<CR>
endif

" No search clearing in cmdline-window
:au CmdwinEnter @ nnoremap <CR> <CR>
:au CmdwinLeave @ nnoremap <CR> :nohlsearch<CR>

" easy tabs
map <leader>tn :tabnew<CR>

" hide quickfix window
" noremap <Leader>q q
nnoremap <Leader>q :ccl<CR>

" easy escape
imap jj <Esc>
imap jk <Esc>
imap kk <Esc>

" easy close
map <leader>x :x<CR>

" easy quit
map <leader>qa :qa<CR>

" indent and tab switching
if has("gui_running")
  " map fullscreen toggle to be same as iterm2
  map <D-CR> :set fullscreen!<CR>

  " fast tab switching
  map <D-j> gt
  map <D-k> gT

  " Map command-[ and command-] to indenting or outdenting
  " while keeping the original selection in visual mode
  vmap <D-]> >gv
  vmap <D-[> <gv

  nmap <D-]> >>
  nmap <D-[> <<

  omap <D-]> >>
  omap <D-[> <<

  imap <D-]> <Esc>>>i
  imap <D-[> <Esc><<i

  " Map Command-# to switch tabs
  map  <D-0> 0gt
  imap <D-0> <Esc>0gt
  map  <D-1> 1gt
  imap <D-1> <Esc>1gt
  map  <D-2> 2gt
  imap <D-2> <Esc>2gt
  map  <D-3> 3gt
  imap <D-3> <Esc>3gt
  map  <D-4> 4gt
  imap <D-4> <Esc>4gt
  map  <D-5> 5gt
  imap <D-5> <Esc>5gt
  map  <D-6> 6gt
  imap <D-6> <Esc>6gt
  map  <D-7> 7gt
  imap <D-7> <Esc>7gt
  map  <D-8> 8gt
  imap <D-8> <Esc>8gt
  map  <D-9> 9gt
  imap <D-9> <Esc>9gt

else
  " Map command-[ and command-] to indenting or outdenting
  " while keeping the original selection in visual mode
  vmap <A-]> >gv
  vmap <A-[> <gv

  nmap <A-]> >>
  nmap <A-[> <<

  omap <A-]> >>
  omap <A-[> <<

  imap <A-]> <Esc>>>i
  imap <A-[> <Esc><<i

  " Map Control-# to switch tabs
  map  <C-0> 0gt
  imap <C-0> <Esc>0gt
  map  <C-1> 1gt
  imap <C-1> <Esc>1gt
  map  <C-2> 2gt
  imap <C-2> <Esc>2gt
  map  <C-3> 3gt
  imap <C-3> <Esc>3gt
  map  <C-4> 4gt
  imap <C-4> <Esc>4gt
  map  <C-5> 5gt
  imap <C-5> <Esc>5gt
  map  <C-6> 6gt
  imap <C-6> <Esc>6gt
  map  <C-7> 7gt
  imap <C-7> <Esc>7gt
  map  <C-8> 8gt
  imap <C-8> <Esc>8gt
  map  <C-9> 9gt
  imap <C-9> <Esc>9gt

  map <C-p> gt
  map <C-n> gT
endif

" tab movement setup, via ara howard

function TabMove(n)
    let nr = tabpagenr()
    let size = tabpagenr('$')
    " do we want to go left?
    if (a:n != 0)
        let nr = nr - 2
    endif
    " crossed left border?
    if (nr < 0)
        let nr = size-1
        " crossed right border?
    elseif (nr == size)
        let nr = 0
    endif
    " fire move command
    exec 'tabm'.nr
endfunction

map <C-Left> :call TabMove(1)<CR>
map <C-Right> :call TabMove(0)<CR>
" map <C-p> :call TabMove(1)<CR>
" map <C-n> :call TabMove(0)<CR>

""" Clojure bindings
" map ,T :w<CR>:Require<CR>:call fireplace#echo_session_eval("(run-all-tests)")<CR>
" nnoremap <C-e> :Eval<CR>
" nnoremap E :%Eval<CR>
" nnoremap cpt :w<CR>:Require<CR>:Eval (run-tests)<CR>


autocmd FileType lisp,scheme,clojure RainbowParentheses
